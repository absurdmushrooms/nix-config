{ pkgs, ... }:

{
  programs.xwayland.enable = true;

  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
  };
}

# kate: space-indent on; indent-width 2;
