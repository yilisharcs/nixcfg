{
  # git-compatible version control system
  programs.jujutsu = {
    enable = true;
    settings = {
      ui = {
        default-command = ["ls"];
      };
      aliases = {
        clone = ["git" "clone" "--colocate"];
        fetch = ["git" "fetch"];
        init  = ["git" "init" "--colocate"];
        ls    = ["log" "--summary"];
        push  = ["git" "push"];
      };
    };
  };
}
