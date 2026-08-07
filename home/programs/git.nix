{ config, pkgs, ...}: {
    home.packages = [pkgs.gh];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Oleksii";
        email = "redmel.alt@gmail.com";
      };
    };
  };
}

# kate: space-indent on; indent-width 2;
