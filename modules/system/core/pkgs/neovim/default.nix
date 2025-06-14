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

  # TODO: configure neovide here
  xdg.mime = {
    enable = true;
    defaultApplications = {
      "application/octet-stream" = "nvim.desktop";
      "application/x-zerosize" = "nvim.desktop";
    };
  };
}
