{ pkgs, ... }:

{
  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
      # fixing issue with cursor inside steam
      package = pkgs.steam.override {
        extraPkgs = pkgs: with pkgs; [
          kdePackages.breeze
        ];
      };
    };

    gamemode.enable = true;
    };
}

# kate: space-indent on; indent-width 2;
