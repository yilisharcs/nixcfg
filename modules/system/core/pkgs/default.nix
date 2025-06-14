{
  pkgs,
  ...
}:

{
  imports = [
    ./bat
    ./git
    ./less
    ./neovim
  ];

  environment.systemPackages = with pkgs; [
    curl             # CLI featureful downloader
    eza              # Better ls/tree
    fd               # Better find
    file
    fzf              # Fuzzy finder
    man-pages        # Linux manpages
    mask             # Task runner with markdown
    nushell          # A modern shell
    ripgrep          # Better grep
    time             # Simple command stopwatch
    tmux             # Terminal multiplexer
    wget             # CLI recursive downloader
  ];

  environment.localBinInPath = true;
}
