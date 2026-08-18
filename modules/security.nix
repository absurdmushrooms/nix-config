{ pkgs, ... }:

{
  security.polkit.enable = true;

  programs = {
    ssh.startAgent = true;
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-qt;
      enableSSHSupport = false;
    };
  };
}

# kate: space-indent on; indent-width 2;
