{ config, pkgs, ...}: {
  home.packages = with pkgs; [
    # social media
    telegram-desktop
    discord-ptb

    # KDE
    kdePackages.kcalc
    kdePackages.partitionmanager
  ];
}

# kate: space-indent on; indent-width 2;
