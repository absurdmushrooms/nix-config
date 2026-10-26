{ lib, pkgs, ...}:

let
  # non-nixpkgs extensions

  # dotrush
  dotrush = pkgs.vscode-utils.buildVscodeMarketplaceExtension {
      mktplcRef = {
        name = "dotrush";
        publisher = "nromanov";
        version = "26.9.244";
        arch = "linux-x64";
        hash = "sha256-idGyNqMN+wdte7UMJz/D0tVerpAS8Tp60Seuv7Kbcxw=";
      };
  };

    # vscode-pdf
    vscode-pdf = (pkgs.vscode-utils.buildVscodeMarketplaceExtension {
      mktplcRef = {
        name = "vscode-pdf";
        publisher = "mathematic";
        version = "0.2.5";
        hash = "sha256-cdDEsaYSm3XmXb3LuNGxwdzczyyYe3tft+3epyO7wuU=";
      };
      # fix version warning
      }).overrideAttrs (oldAttrs: {
      nativeBuildInputs = (oldAttrs.nativeBuildInputs or []) ++ [ pkgs.jq ];
      postInstall = (oldAttrs.postInstall or "") + ''
        jq '.engines.vscode = "^1.126.0"' $out/share/vscode/extensions/mathematic.vscode-pdf/package.json > tmp.json && mv tmp.json $out/share/vscode/extensions/mathematic.vscode-pdf/package.json
      '';
      });

    # vscode-avalonia
    vscode-avalonia = (pkgs.vscode-utils.buildVscodeMarketplaceExtension {
      mktplcRef = {
        name = "vscode-avalonia";
        publisher = "AvaloniaTeam";
        version = "12.4.3";
        hash = "sha256-JjcqeIsni8Slj25D8mw4SduZrjHRvkGhoo/sycgvfEU=";
      };
    # fix errors with proprietary ms-dotnet dependencies
    }).overrideAttrs (oldAttrs: {
      nativeBuildInputs = (oldAttrs.nativeBuildInputs or []) ++ [ pkgs.jq ];
      postInstall = (oldAttrs.postInstall or "") + ''
        jq '.extensionDependencies -= ["ms-dotnettools.csdevkit"]' $out/share/vscode/extensions/AvaloniaTeam.vscode-avalonia/package.json > tmp.json && mv tmp.json $out/share/vscode/extensions/AvaloniaTeam.vscode-avalonia/package.json
      '';
    });

in {
  # main config
  programs.vscodium = {
    enable = true;
    package = pkgs.vscodium.fhsWithPackages (ps: with ps; [
      # dependencies that needed for avalonia to work
      fontconfig
      freetype
      libGL
      libx11
      libice
      libsm
      stdenv.cc.cc.lib
    ]);

    profiles.default = {
      userSettings = {
        "telemetry.telemetryLevel" = "off";

        # terminal settings
        "terminal.integrated.defaultProfile.linux" = "zsh";
        "terminal.integrated.fontFamily" = "JetBrainsMono Nerd Font Mono";
        "workbench.colorCustomizations" = {
            "terminal.foreground" = "#FFFFFF";
            "terminal.background" = "#000000";
        };
      };
      extensions = [
        # dotrush enabled via script
        vscode-pdf
        vscode-avalonia
        pkgs.vscode-extensions.ms-dotnettools.vscode-dotnet-runtime
      ];
    };
  };

  # make dotrush work
  home.activation.installDotRush = lib.hm.dag.entryAfter ["writeBoundary"] ''
    EXT_DIR="$HOME/.vscode-oss/extensions/nromanov.dotrush-26.9.244"

    rm -rf "$EXT_DIR"
    mkdir -p "$EXT_DIR"
    cp -r ${dotrush}/share/vscode/extensions/nromanov.dotrush/. "$EXT_DIR/"
    chmod -R +w "$EXT_DIR"
  '';
}

# kate: space-indent on; indent-width 2;
