{ myvars, ... }:

{
  services.howdy = {
    enable = true;
    control = "sufficient";
    settings = {
      video = {
        device_path = myvars.ircampath;
        dark_threshold = 50;
      };
      core = {
        detection_notice = false;
        supress_unknown = true;
        abort_if_no_ir = true;
      };
    };
  };
  security.pam.services = {
    login.howdy.enable = true;
    sudo.howdy.enable = true;
    sddm.howdy.enable = true;
    polkit-1.howdy.enable = false;
  };
}

# kate: space-indent on; indent-width 2;
