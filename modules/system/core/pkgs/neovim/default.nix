{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  environment.variables = {
    SUDO_EDITOR = "nvim";
  };
}
