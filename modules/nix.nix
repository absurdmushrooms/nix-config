{
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
    # deduplicate store files
    settings.auto-optimise-store = true;

    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  programs.nix-ld.enable = true;

  nixpkgs = {
    config.allowUnfree = true;
    config.permittedInsecurePackages = [
    "openssl-1.1.1w"
    ];
  };
}

# kate: space-indent on; indent-width 2;
