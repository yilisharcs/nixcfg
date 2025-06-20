{
  # git-compatible version control system
  programs.jujutsu = {
    enable = true;
    settings = {
      ui = {
        default-command = ["log" "--reversed"];
      };
      aliases = {
        init = ["git" "init" "--colocate"];
        clone = ["git" "clone" "--colocate"];
      };
    };
  };
}
