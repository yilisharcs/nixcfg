{
  programs = {
    ripgrep-all.enable = true;
    ripgrep = {
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
  };
}
