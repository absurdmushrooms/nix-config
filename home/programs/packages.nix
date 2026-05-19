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

    # gaming utils
    mangohud
    goverlay
    protonup-qt

    # KDE utils
    kdePackages.kcalc
    kdePackages.partitionmanager
  ];
}

# kate: space-indent on; indent-width 2;
