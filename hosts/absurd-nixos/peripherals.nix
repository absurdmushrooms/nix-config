{
  # ===== extra modprobe configuration =====
  boot.extraModprobeConfig = ''
    # fixing speakers issues
    options snd-hda-intel model=(null),alc287-yoga9-bass-spk-pin

    # fixing issues with wifi and bluetooth conflicts on realtek rtw89 driver
    options rtw89_pci disable_aspm=y
    options rtw89_core disable_ps_mode=y
  '';

  # ===== wifi =====
  # disable wifi power saving
  networking.networkmanager.wifi.powersave = false;

  # ===== display streaming =====
  # sunshine support
  services.sunshine = {
    enable = true;
    capSysAdmin = true;
    openFirewall = true;
  };

}

# kate: space-indent on; indent-width 2;
