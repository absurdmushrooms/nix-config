{ pkgs, myvars, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./../hosts/${myvars.hostname}/hardware-gen.nix
    ];

  boot.loader = {
    limine.enable = true;
    grub.enable = false;
    systemd-boot.enable = false;
    limine.efiSupport = true;
    efi.canTouchEfiVariables = true;
    limine.secureBoot.enable = true;
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;
}

# kate: space-indent on; indent-width 2;
