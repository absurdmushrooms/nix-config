{ myvars, ... }:

{
  users.users.${myvars.username} = {
    isNormalUser = true;
    description = myvars.userfullname;
    extraGroups = [ "wheel" "video" ];
    home = "/home/${myvars.username}";

    openssh.authorizedKeys.keys = myvars.mainSshAuthorizedKeys;
  };
}

# kate: space-indent on; indent-width 2;
