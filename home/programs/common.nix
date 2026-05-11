{ config, pkgs, ...}: {
  home.packages = with pkgs; [
    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    fastfetch
    btop

    # misc
    eza
    file
    which
    tree
    gnutar
    zstd

    # adding font for terminal
    nerd-fonts.jetbrains-mono

    # compilers
    gcc

    # nix related
    nix-output-monitor # it provides the command `nom` works just like `nix` with more details log output
    nil

    # productivity
    howdy

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
  ];

}

# kate: space-indent on; indent-width 2;
