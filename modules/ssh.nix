{
    networking.firewall.enable = false;

    services.openssh = {
      enable = true;
      settings = {
        X11Forwarding = true;
      };
      openFirewall = true;
    };

    environment.enableAllTerminfo = true;
}

# kate: space-indent on; indent-width 2;
