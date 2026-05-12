# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware.nix
    ];

  # enabling limine as bootloader with secureboot support
  boot.loader = {
    limine.enable = true;
    grub.enable = false;
    systemd-boot.enable = false;
    limine.efiSupport = true;
    efi.canTouchEfiVariables = true;
    limine.secureBoot.enable = true;
  };

  services.power-profiles-daemon = {
    enable = true;
  };

  # use latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # hostname
  networking.hostName = "absurd-nixos";

  # enabling networkmanager
  networking.networkmanager.enable = true;

  # setting up timezone
  time.timeZone = "Europe/Kyiv";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # selecting internationalisation properties
  i18n.defaultLocale = "uk_UA.UTF-8";
  i18n.supportedLocales = [
    "en_US.UTF-8/UTF-8"
    "uk_UA.UTF-8/UTF-8"
  ];

  console = {
     font = "Lat2-Terminus16";
     useXkbConfig = true; # use xkb.options in tty.
   };

  # enabling the X11 windowing system for compatibility
  services.xserver.enable = true;
  
  # enabling KDE and SDDM
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
  };

  # enabling bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # configure keymap in X11
  services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # enabling CUPS to print documents.
  services.printing.enable = true;

  # enabling sound
  services.pulseaudio.enable = false; # Disable PulseAudio
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };
  # fixing speakers issues
  boot.extraModprobeConfig = ''
    options snd-hda-intel model=(null),alc287-yoga9-bass-spk-pin
  '';

  # enabling touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;
    
  # defining a user account
  users.users.absurd = {
    isNormalUser = true;
    description = "Oleksii";
    extraGroups = [ "wheel" "video" ];
    home = "/home/absurd";
  };
  
  # changing nixpkgs settings
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
  ];
  
  # enabling firefox
  programs.firefox.enable = true;

  # enabling steam and fixing issue with cursor inside it
  programs.steam = {
    enable = true;
    package = pkgs.steam.override {
      extraPkgs = pkgs: with pkgs; [
        kdePackages.breeze
      ];
    };
  };

  # enabling flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # system packages
  environment.systemPackages = with pkgs; [
     vim
     wget
     brightnessctl
     howdy
     git
     parallel
   ];

  # setting vim as default text editor
   environment.variables.EDITOR = "vim";

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
   programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
   };

  # List services that you want to enable:

  # enable the OpenSSH daemon.
  services.openssh.enable = true;

  # enabling howdy
  services.howdy = {
    enable = true;
    control = "sufficient";
    settings = {
      video = {
        device_path = "/dev/video2";
        dark_threshold = 50;
      };
      core = {
        detection_notice = false;
        supress_unknown = true;
        abort_if_no_ir = true;
      };
    };
  };
  security.pam.services = {
    login.howdy.enable = true;
    sudo.howdy.enable = true;
    sddm.howdy.enable = true;
    polkit-1.howdy.enable = false;
};


  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.11";

}

# kate: space-indent on; indent-width 2;
