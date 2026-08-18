{
  description = "Main NixOS flake";

  inputs = {
    # NixOS official package source
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Adding Firefox Nightly inputs
    firefox-nightly.url = "github:nix-community/flake-firefox-nightly";
    firefox-nightly.inputs.nixpkgs.follows = "nixpkgs";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
    inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }:
    let
      myvars = import ./vars/default.nix;
    in {
      nixosConfigurations.${myvars.hostname} = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs myvars;
        };

      modules = [
        ./hosts/base/default.nix
        ./hosts/${myvars.hostname}/default.nix

        home-manager.nixosModules.home-manager
        {
          home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          backupFileExtension = "bak";

          extraSpecialArgs = { inherit myvars; };
          users.${myvars.username} = import ./home/home.nix;
          };
        }
      ];
    };
  };
}

# kate: space-indent on; indent-width 2;
