{
  programs = {
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

    gh = {
      enable = true;
      settings = {
        git_protocol = "ssh";
      };
    };
  };

  home.shellAliases = {
    gitcon  = "gitcon.nu";
    gitgrep  = "gitgrep.nu";
    gitlist = "gitlist.nu";
  };

  home.file = {
    ".local/bin/gitcon.nu".source = ./gitcon.nu;
    ".local/bin/gitgrep.nu".source = ./gitgrep.nu;
    ".local/bin/gitlist.nu".source = ./gitlist.nu;
  };
}
