{ pkgs, ... }:

pkgs.appimageTools.wrapType2 rec {
  pname = "eara";
  version = "0.5.3";
  src = pkgs.fetchurl {
    url = "https://github.com/oneydef/EarA-linux/releases/download/v${version}/EarA-${version}-x86_64.AppImage";
    hash = "sha256-0HIH3qsbherXf1l7cLi04I70za3j6R3x89tGpq/aJWM=";
  };

  extraInstallCommands = let
    appimageContents = pkgs.appimageTools.extract { inherit pname version src; };
  in ''
    install -m 444 -D ${appimageContents}/eara.desktop -t $out/share/applications
    cp -r ${appimageContents}/usr/share/icons $out/share
  '';
}
