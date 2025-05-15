{
  config,
  pkgs,
  inputs,
  ...
}:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.yilisharcs = {
    # initialHashedPassword = "$y$j9T$Fs0yyOMNtsNrMGuB.CCRD0$8Lb.ND9t.Nfe5WpExqrDFDCdvX8NGuT6pS1balITiA3";
    isNormalUser = true;
    description = "yilisharcs";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];

    packages = with pkgs; [
      atool                          # compression and extraction tools
      bat                            # better cat
      brave # chromium browser fork with built-in adblocker
      btop                           # tui system monitor
      carapace                       # multishell completion engine
      chafa                          # terminal image visualizer
      ctpv                           # lf previewer
      fastfetch
      fd                             # better find
      ffmpeg
      ffmpegthumbnailer
      # imagemagick
      less                           # pager utility
      lf                             # tui file explorer
      man-pages                      # Linux man pages
      mesa                           # graphics lib
      ncdu                           # disk space checker
      # unstable.neovim      # extensible text editor #unset unstable once 1.0.0 is out
      neovide                        # graphical neovim client
      # nushell
      nushellPlugins.gstat
      nushellPlugins.query
      nushellPlugins.skim #regex,units,highlight
      pandoc                         # markup converter
      pass                           # cli password manager #optionally: `pass-wayland` with gnome de
      # picard                         # music metadata editor
      porsmo                         # cli pomodoro app
      ripgrep                        # better grep #optionally: `ripgrep-all` for extended features
      skim                           # fuzzy finder
      speedtest-rs
      starship                       # shell prompt tool
      stow                           # symlink manager
      syncthing                      # peer-to-peer file sync
      trash-cli
      tree                           # dir viewer
      wl-clipboard                   # pass dependency
      yt-dlp
      zk
      zoxide                         # better cd

      # dev libs and tools
      bacon                          # background code checker
      cargo-audit
      cargo-auditable
      cargo-binstall
      cargo-generate
      cargo-modules
      cargo-nextest
      cargo-sweep
      cargo-update
      dioxus-cli
      direnv                         # automatic invocation of shell.nix with .envrc
      # fnm                            # fast node version manager
      gh                             # github cli tool
      # go
      # unstable.jujutsu             # git-compatible version control system
      mold                           # better linker
      # pipx                           # python package manager
      # python314
      ra-multiplex                   # rust-analyzer multiplex server
      # rustup                         # rust toolchain manager
      sccache                        # build cache tool
      sqlite
      tmux
      tokei                          # loc counter
      yq                             # cli json, yaml, and xml processor
    ];
  };
  home-manager.users.yilisharcs =
    import ../../../home/yilisharcs/${config.networking.hostName}.nix;
}
