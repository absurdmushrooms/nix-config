{
  programs.eza = {
        enable = true;
        git = true;
        icons = "auto";
  };

  home.shellAliases = {
    els = "eza --icons --group-directories-first -1";
    etree = "eza --icons --tree --group-directories-first";
  };
}

# kate: space-indent on; indent-width 2;
