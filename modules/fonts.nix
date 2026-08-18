{ pkgs, config, lib, ... }:

{
  fonts.packages = with pkgs; [
    # icon fonts
    material-design-icons
    font-awesome

    # nerdfonts
    nerd-fonts.symbols-only
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka

    # noto google
    noto-fonts
    noto-fonts-color-emoji
  ];

  fonts.fontconfig.enable = true;
}

# kate: space-indent on; indent-width 2;
