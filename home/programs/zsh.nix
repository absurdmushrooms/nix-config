{ config, pkgs, ...}: {
  programs.zsh = {
    enable = true;
    history.size = 10000;
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; tags = [ as:plugin ]; }
        { name = "zsh-users/zsh-syntax-highlighting"; tags = [ as:plugin  ]; }
        { name = "zsh-users/zsh-history-substring-search"; tags = [ as:plugin ]; }
      ];
    };
    initContent = ''
    ZSH_AUTOSUGGEST_STRATEGY=(completion)
    '';
    shellAliases = {
      update = "sudo nixos-rebuild switch";
    };
  };
}

# kate: space-indent on; indent-width 2;
