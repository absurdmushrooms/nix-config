{ config, pkgs, myvars, ... }:

{
  home.username = myvars.username;
  home.homeDirectory = "/home/${myvars.username}";

  imports = [
    ./base/core.nix
    ./base/git.nix
    ./base/eza.nix
    ./base/tealdeer.nix
    ./base/starship.nix
    ./base/zsh.nix
    ./${myvars.hostname}/packages.nix
  ];

  home.shellAliases = {
      update = "sudo nixos-rebuild switch";
      upgrade = "cd /etc/nixos/ && sudo nix-channel --update && nix flake update && sudo nixos-rebuild switch";
  };

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
