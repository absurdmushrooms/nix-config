{ config, pkgs, ...}: {
    home.packages = [pkgs.gh];

  programs.git = {
    enable = true;
    userName = "Oleksii";
    userEmail = "redmel.alt@gmail.com";
  };
}

# kate: space-indent on; indent-width 2;
