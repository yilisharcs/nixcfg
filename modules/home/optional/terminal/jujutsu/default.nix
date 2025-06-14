{
  programs = {
    # git-compatible version control system
    jujutsu = {
      enable = true;
      settings = {
        ui = {
          default-command = ["log" "--reversed"];
        };
        aliases = {
          init = ["git" "init"];
        };
      };
    };
  };
}
