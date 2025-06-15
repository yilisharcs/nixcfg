{
  pkgs,
  ...
}:

{
# Terminal multiplexer
programs.tmux = {
    enable = true;
    aggressiveResize = true;
    baseIndex = 1;
    clock24 = true;
    escapeTime = 0;
    focusEvents = true;
    historyLimit = 5000;
    keyMode = "emacs"; # TODO: try vim keybindings in the shell
    mouse = true;
    newSession = true;
    prefix = "C-t";
    shell = "${pkgs.nushell}/bin/nu";
    terminal = "tmux-256color";
    extraConfig = ''
      set -g display-time 4000    # Increase tmux messages display duration from 750ms to 4s

      set-option -g window-status-current-format '[ *#I:#W#F ]'
      set -g status-style 'bg=green fg=#000000,bold'
      set -g status-left-length 0 # no limit to status length
      set -g status-right-length 0
      set -g status-left '[#S] #{user}@#h'
      set -g status-right '[%F]'
      set -g status-justify centre
      set -g status-interval 5
      setw -g automatic-rename on

      setw -g mode-keys vi
      setw -g mode-style 'bg=#fab387 fg=#000000'
      bind -T copy-mode-vi 'v' send -X begin-selection
      bind -T copy-mode-vi 'y' send -X copy-pipe-and-cancel 'xclip -sel clip'
    '';
  };
}
