{ pkgs, myvars, ... }:

{
  networking.hostName = myvars.hostname;
  networking.networkmanager.enable = true;
}

# kate: space-indent on; indent-width 2;
