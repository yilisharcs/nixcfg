{
  # Better grep
  programs.ripgrep = {
    enable = true;
    arguments = [
      "--hidden"
      "--follow"
      "--glob=!.cache/*"
      "--glob=!.git/*"
      "--glob=!.npm/*"
      "--glob=!Trash/*"
      "--smart-case"
    ];
  };

  home.shellAliases = {
    grep = "rg";
  };
}
