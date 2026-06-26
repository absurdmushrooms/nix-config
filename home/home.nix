{ config, pkgs, ... }:

{
  home.username = "absurd";
  home.homeDirectory = "/home/absurd";

  # Packages that should be installed to the user profile.
  imports = [
    ./programs/common.nix
    ./programs/git.nix
    ./programs/zsh.nix
    ./programs/packages.nix
  ];

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "26.05";
}

# kate: space-indent on; indent-width 2;
