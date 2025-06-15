{
  home.shellAliases = {
    fetch = "fastfetch";
  };

  programs.fastfetch = {
    enable = true;
    settings = {
      modules = [
        { type = "title"; }
        { type = "separator"; }
        { type = "os"; }
        { type = "host"; }
        { type = "kernel"; }
        { type = "uptime"; }
        { type = "packages"; }
        { type = "shell"; }
        { type = "de"; }
        { type = "wm"; }
        { type = "font"; }
        { type = "cursor"; }
        { type = "cpu"; }
        { type = "gpu"; }
        { type = "memory"; }
        { type = "swap"; }
        { type = "disk"; }
        { type = "break"; }
        { type = "colors"; }
      ];
    };
  };
}
