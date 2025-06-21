{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./bat
    ./eza
    ./fd
    ./fzf
    ./git
    ./gpg
    ./less
    ./mask
    ./neovim
    ./ripgrep
    ./tmux
    ./xkb
    ./yazi
    ./zoxide
  ];

  home.packages = with pkgs; [
    curl             # CLI featureful downloader
    file
    man-pages        # Linux manpages
    time             # Simple command stopwatch
    tinyxxd          # Hex dump utility
    wget             # CLI recursive downloader
  ];

  home.shell.enableShellIntegration = true;

  # NOTE: GNOME does not respect sessionPath
  home.sessionPath = ["$HOME/.local/bin"];
  home.activation = {
    mkLocalBinDir = lib.hm.dag.entryAfter ["writeBoundary"] ''
      run mkdir -p "${config.home.homeDirectory}/.local/bin"
    '';
  };
}
