{ pkgs, inputs, ... }:

{
  # fwupd
  services.fwupd.enable = true;

  # firefox nightly
  programs.firefox = {
    enable = true;
    package = inputs.firefox-nightly.packages.${pkgs.stdenv.hostPlatform.system}.firefox-nightly-bin;
  };

  # partition manager
  programs.partition-manager.enable = true;

  # other packages
  environment.systemPackages = with pkgs; [
    # core tools
    fastfetch
    vim
    gnumake # Makefile
    just # command runner like gnumake, but simpler
    git

    # system monitoring
    procs # a modern ps
    btop

    # archives
    zip
    xz
    zstd
    unzipNLS
    p7zip
    gnutar

    # file search
    fd
    findutils

    # analyze disk space
    dust

    # networking tools
    gping # ping, but with a graph(TUI)
    wget
    curl
    nmap # utility for network discovery and security auditing

    # security
    openssl

    # misc
    file
    which
    tree
    tealdeer # a very fast version of tldr

    # system tools
    sysstat
    lm_sensors # for "sensors" command
    ethtool
    parted
    pciutils # lspci
    usbutils # lsusb
    nvme-cli

    # desktop
    brightnessctl

    # java utils
    jdk21

    # media tools
    ffmpeg-full

    # other
    parallel
    harfbuzz
  ];

  environment.variables = {
    EDITOR = "vim";
    VISUAL = "vim";
    SUDO_EDITOR = "vim";
  };

}

# kate: space-indent on; indent-width 2;
