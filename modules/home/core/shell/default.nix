{
  pkgs,
  ...
}:

{
  imports = [
    ./bin-scripts
  ];

  home.shellAliases = {
    # convenience
    ":q"     = "exit";
    nsp      = "nix search nixpkgs";
  };

  programs = {
    # A modern shell
    nushell = {
      enable = true;
      envFile.text = ''
        $env.SUDO_PROMPT = $'(ansi red_bold)[sudo](ansi reset) password for %u: '
      '';
      plugins = with pkgs.nushellPlugins; [
        gstat
        # highlight #regex
        query
        # skim  ### NOTE: these seem to be outdated
        # units ### NOTE: mismatched versions
      ];
      configFile.text = ''
        $env.config.plugin_gc = {
          default: {
            enabled: true
            stop_after: 10sec
          }
          plugins: {
            gstat: { stop_after: 1min }
            inc: { stop_after: 0sec }
          }
        }
      '';
      settings = {
        show_banner = false;
        buffer_editor = "nvim";
        history = {
          file_format = "plaintext";
          max_size = 10000000;
          sync_on_enter = true;
          isolation = false;
        };
        keybindings = [
          {
            name = "job_to_foreground";
            modifier = "control";
            keycode = "char_z";
            mode = ["emacs" "vi_insert" "vi_normal"];
            event = {
              send = "executehostcommand";
              cmd = "job unfreeze";
            };
          }
          {
            name = "fuzzy_history";
            modifier = "control";
            keycode = "char_r";
            mode = ["emacs" "vi_normal" "vi_insert"];
            event = {
              send = "executehostcommand";
              cmd = ''commandline edit --replace (
                history
                | reverse
                | group-by command
                | values
                | each { $in.0 }
                | each { $"($in.index + 1)     ($in.command)" }
                | str join (char -i 0)
                | fzf
                --read0
                --layout reverse
                --query (commandline)
                --scheme history
                --preview-window hidden
                --bind='ctrl-y:execute-silent(echo -n {2..} | wl-copy)+abort'
                --header 'Press CTRL-Y to copy command into clipboard'
                | decode utf-8
                | str trim
                | str replace -r "^\\d+\\s{5}" ""
              )'';
            };
          }
        ];
      };
      # shellAliases = { };
    };

    bash = {
      enable = true;
      initExtra = ''
        PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
        PROMPT_COMMAND='history -a'
        HISTTIMEFORMAT="%F %T "

        bind -x '"\C-g":"tmux-sessionizer"'
        bind    '"\C-o": edit-and-execute-command'
      '';
      historyControl = ["ignoreboth"];
      historyIgnore = [
        "vi"
        "vim"
        "nvim"
        ":q"
        "l[fs]"
        "pwd"
        "[bf]g"
        "tmuxa"
      ];
      shellAliases = {
        ".." = "cd ..";
        cp = "cp -iv";
        rm = "rm -I";
      };
      shellOptions = [
        "checkwinsize"
        "histappend"
      ];
    };
  };
}
