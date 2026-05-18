{ config, pkgs, ...}: {

  # enabling obs studio
  programs.obs-studio.enable = true;

  home.packages = with pkgs; [
    # social media
    telegram-desktop
    discord-ptb

    # graphical/video editors
    krita
    inkscape
    kdePackages.kdenlive

    # KDE utils
    kdePackages.kcalc
    kdePackages.partitionmanager
  ];
}

# kate: space-indent on; indent-width 2;
