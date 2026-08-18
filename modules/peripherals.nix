{
  # ===== audio =====

  security.rtkit.enable = true;

  services = {
    pulseaudio.enable = false;
    pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        jack.enable = true;
    };
  };

  # ===== bluetooth =====

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  # ===== input =====

  services.libinput.enable = true;

  # ==== misc =====

  services = {
    printing.enable = true;
    geoclue2.enable = true;
  };

}

# kate: space-indent on; indent-width 2;
