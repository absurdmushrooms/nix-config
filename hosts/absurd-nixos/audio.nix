{
  # fixing speakers issues
  boot.extraModprobeConfig = ''
    options snd-hda-intel model=(null),alc287-yoga9-bass-spk-pin
  '';
}

# kate: space-indent on; indent-width 2;
