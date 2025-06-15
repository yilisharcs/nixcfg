{
  # Better ls/tree
  programs.eza = {
    enable = true;
    colors = "always";
    extraOptions = [
      "--group-directories-first"
    ];
  };

  home.shellAliases = {
    lx = "eza";
  };
}
