{
  programs = {
    # NOTE: Box characters are drawn incorrectly if provided
    # by nix, regardless of the operating system. I don't know why.
    neovide = {
      enable = true;
      settings = {
        font = {
          size = 13;
          normal = [ "JetBrainsMono Nerd Font" "Noto Color Emoji" ];
          bold = { family = "JetBrainsMono Nerd Font"; style = "Bold"; };
          bold_italic = { family = "JetBrainsMono Nerd Font"; style = "BoldItalic"; };
          edging = "subpixelantialias";
        };
        maximized = true;
        no-multigrid = false;
        wsl = false;
      };
    };
  };

  xdg.mimeApps.defaultApplications = {
    "application/x-zerosize" = [
      "neovide.desktop"
      "nvim.desktop"
    ];
  };
}
