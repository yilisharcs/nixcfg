{
  # Environment variable manager
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    config = {
      global = {
        log_filter = "^loading";
        strict_env = true;
        warn_timeout = "30m";
      };
    };
  };
}
