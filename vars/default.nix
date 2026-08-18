{
  hostname = "absurd-nixos";
  username = "absurd";
  userfullname = "Oleksii";
  useremail = "redmel.alt@gmail.com";

  mainSshAuthorizedKeys = [
    # The main ssh keys for daily usage
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOJl+mXrTUiKVEU6WULfFpWCSZW7WyuG75K7r4QKZIeS redmel.alt@gmail.com"
  ];

  # optional, if using howdy
  ircampath = "/dev/video2";
}

# kate: space-indent on; indent-width 2;
