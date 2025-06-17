{
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
  ];

  home.packages = with pkgs; [
    curl             # CLI featureful downloader
    file
    man-pages        # Linux manpages
    time             # Simple command stopwatch
    wget             # CLI recursive downloader
  ];

  home.shell.enableShellIntegration = true;
}
