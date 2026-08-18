{ myvars, ... }:

{
  imports = [
  ./../../modules/i18n.nix
  ./../../modules/users.nix
  ./../../modules/tty.nix
  ./../../modules/power.nix
  ./../../modules/boot.nix
  ./../../modules/networking.nix
  ./../../modules/security.nix
  ./../../modules/peripherals.nix
  ./../../modules/desktop.nix
  ./../../modules/ssh.nix
  ./../../modules/nix.nix
  ./../../modules/fonts.nix
  ./../../modules/packages.nix
  ./../../modules/gaming.nix
  ];

  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.11";
}

# kate: space-indent on; indent-width 2;
