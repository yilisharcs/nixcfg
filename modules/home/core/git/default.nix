{
  pkgs,
  ...
}:

{
  programs = {
    gh = {
      enable = true;
      settings = {
        git_protocol = "ssh";
      };
    };

    git = {
      enable = true;
      aliases = {
        last = "log -1 HEAD";
        logd = "log --decorate --oneline --graph";
        unstage = "reset HEAD --";
      };
      ignores = [
        ".env"
      ];
      extraConfig = {
        init.defaultBranch = "main";
        core.editor = "nvim";
        diff.tool = "nvimdiff";
        merge.tool = "nvimdiff";
        pull.rebase = true;
        rebase.autoStash = true;
        safe.directory = "/etc/nixos";
      };
    };
  };
}
