{ pkgs, ...}:

{
  imports = [
    ./vscodium.nix
  ];

  # enabling obs studio
  programs.obs-studio.enable = true;

  home.packages = with pkgs; [
    # compilers
    gcc
    dotnetCorePackages.sdk_10_0

    # social media
    telegram-desktop
    discord-ptb

    # graphical/video editors
    krita
    inkscape
    kdePackages.kdenlive

    # musical player
    haruna

    # gaming utils
    mangohud
    goverlay
    protonup-qt

    # game launchers
    prismlauncher

    # KDE utils
    kdePackages.kalk
    #kclock with kclockd fix
    (kdePackages.kclock.overrideAttrs (oldAttrs: {
      qtWrapperArgs = (oldAttrs.qtWrapperArgs or []) ++ [
        "--prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath [ pipewire ]}"
      ];
    }))

    ];
}

# kate: space-indent on; indent-width 2;
