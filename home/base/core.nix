{ config, pkgs, ...}:

{
  home.packages = with pkgs; [
    # nix related
    nix-output-monitor # it provides the command `nom` works just like `nix` with more details log output
    nil
    hydra-check # check hydra(nix's build farm) for the build status of a package
    nix-index # small utility to index nix store paths
    nix-init # generate nix derivation from url
    nix-melt # TUI flake.lock viewer
    nix-tree # TUI to visualize the dependency graph of a nix derivation
  ];
}

# kate: space-indent on; indent-width 2;
