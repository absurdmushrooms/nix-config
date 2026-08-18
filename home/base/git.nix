{ config, pkgs, lib, myvars, ...}:

{
  home.packages = [pkgs.gh];

  home.activation.removeExistingGitconfig = lib.hm.dag.entryBefore [ "checkLinkTargets" ] ''
    rm -f ${config.home.homeDirectory}/.gitconfig
  '';

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = myvars.userfullname;
        email = myvars.useremail;
      };

      init.defaultBranch = "main";
    };
  };
}

# kate: space-indent on; indent-width 2;
