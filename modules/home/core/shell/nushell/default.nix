{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.file.".local/bin/helpless.nu".source = ./helpless.nu;
  home.file.".local/bin/rsyncit.nu".source = ./rsyncit.nu; # TODO: make a systemd service and timer

  home.activation =
    let
      scratch = "${config.home.homeDirectory}/.local/bin/scratch.nu";
    in
      {
    nuMutableScratchFile = lib.hm.dag.entryAfter ["writeBoundary"] ''
      run touch ${scratch}
      run chmod 755 ${scratch}
      run echo "#!/usr/bin/env nu

      print $\"(ansi yellow_bold)Scratch is empty.(ansi reset)\"" > ${scratch}
    '';
  };

  programs.nushell = {
    enable = true;
    plugins = with pkgs.nushellPlugins; [
      gstat
      query
      semver
    ];
    shellAliases = {
      wut = "helpless.nu";
    };
    envFile.text = ''
      $env.SUDO_PROMPT = $'(ansi red_bold)[sudo](ansi reset) password for %u: '
    '';
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
  };
}
