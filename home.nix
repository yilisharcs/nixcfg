{
  config,
  lib,
  nixgl,
  pkgs,
  ...
}:

{
  # These wrapper options must be set before declaring packages
  nixGL.packages = import nixgl { inherit pkgs; };
  nixGL.defaultWrapper = "mesa"; # or the driver you need
  nixGL.installScripts = [ "mesa" ];

  # NOTE: I don't know what this does but I was told it's good
  targets.genericLinux.enable = true;

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "yilisharcs";
  home.homeDirectory = "/home/yilisharcs";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/yilisharcs/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    SUDO_EDITOR = "nvim";
    VISUAL = "nvim";
    EDITOR = "nvim";
    LESS = "-FRX";
    SQLITE_HISTORY = "${config.home.homeDirectory}/.local/state/sqlite3/sqlite_history";
    STARSHIP_LOG = "error";
    ZK_NOTEBOOK_DIR = "$HOME/notebook";
  };

  home.sessionPath = [
    "$HOME/.local/bin"  # Include user's private bin
    "/usr/sbin"         # Include root binaries
  ];

  home.shellAliases = {
    # muscle memory
    vi = "nvim";
    vim = "nvim";
    ":q" = "exit";

    # proof of defeat
    apkg = "apt-cache";
    yeet = "sudo apt-get purge --auto-remove";

    # convenience
    grep = "grep --color=auto";
    fetch = "fastfetch";
    nsp = "nix search nixpkgs";
    pomo = "porsmo";
    speedtest = "speedtest-rs";
    wiki = "wiki-tui";

    # nushell scripts
    gitcon = "gitcon.nu";
    gitlist = "gstat.nu";
    tokeicon = "tokeicon.nu";
    wut = "helpless.nu";
  };

  home.shell.enableBashIntegration = true;
  home.shell.enableNushellIntegration = true;

  home.pointerCursor = {
    enable = true;
    name = "Bibata-Modern-Ice";
    size = 24;
    package = pkgs.bibata-cursors;
    gtk.enable = true;
  };
  gtk.enable = true; # Must be set to activate above config

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Disable if you don't want unfree packages
  nixpkgs.config.allowUnfree = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')

    chafa                          # terminal image visualizer
    ctpv                           # lf previewer
    dconf-editor
    entr                           # file watcher
    # evolution                      # mail client
    ffmpeg
    ffmpegthumbnailer
    # file                           # isn't this a core-util?
    gdu                            # disk space analyzer
    gimp                           # image editor
    # gnome-boxes                    # virtual machines
    gnome-tweaks
    hunspell                       # spell checker
    hunspellDicts.en_US
    hunspellDicts.pt_BR
    imagemagick
    inkscape                       # image editor
    # libreoffice-qt                 # office suite
    lf                             # tui file explorer
    # man-pages                      # Linux man pages
    # man                            # man command
    mesa                           # graphics lib
    nerd-fonts.jetbrains-mono
    noto-fonts-emoji
    obs-studio
    pandoc                         # markup converter
    picard                         # music metadata editor
    porsmo                         # cli pomodoro app
    qbittorrent
    speedtest-rs
    stow                           # symlink manager
    trash-cli
    tree                           # dir viewer
    # wiki-tui
    wl-clipboard
    xclip

    # compression and extraction tools
    atool
    unzip
    zip

    # LSP
    lua-language-server
    nil
    vim-language-server

    # # dev libs and tools
    # cargo-audit
    # cargo-auditable
    # cargo-binstall
    # cargo-generate
    # cargo-modules
    # cargo-nextest
    # cargo-sweep
    # cargo-update
    curl
    # dioxus-cli
    jq                             # cli json processor
    # mold                           # better linker
    # python3
    ra-multiplex                   # rust-analyzer multiplex server
    # rustup                         # rust toolchain manager
    sccache                        # build cache tool
    # sqlite
    tokei                          # loc counter
    wget
  ];

  programs = {
    # chromium fork with built-in adblocker
    chromium = {
      enable = true;
      package = pkgs.brave;
      extensions = [
        { id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; } # Dark reader
        { id = "cofdbpoegempjloogbagkncekinflcnj"; } # DeepL
        { id = "ghmbeldphafepmbegfdlkpapadhbakde"; } # Proton Pass
        { id = "eninkmbmgkpkcelmohdlgldafpkfpnaf"; } # Reddit Untranslate
        { id = "fakeocdnmmmnokabaiflppclocckihoj"; } # Sprucemarks
        { id = "dbepggeogbaibhgnhhndojpepiihcmeb"; } # Vimium
        { id = "kkmlkkjojmombglmlpbpapmhcaljjkde"; } # Zhongwen: Zh-En Dictionary
      ];
    };
    firefox.enable = false;

    # background code checker
    bacon = {
      enable = true;
      settings = {
        summary = true;
        wrap = false;
        reverse = false;
        help_line = false;
        on_change_strategy = "kill_then_restart";
        exports.locations = {
          auto = false;
          exporter = "locations";
          path = ".bacon-locations";
          line_format = "{kind} {path}:{line}:{column} {message}";
        };
        sound.enabled = false;
      };
    };

    bash = {
      enable = true;
      # NOTE: Something is causing mime.desktop files and binaries to not be
      # found on re-login. Adding the entries below to PATH ensures binaries
      # can be found by the shell so the ensuing experience isn't awful.
      initExtra = ''
        PATH="$HOME/.nix-profile/bin:/nix/var/nix/profiles/default/bin:$PATH"

        PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
        PROMPT_COMMAND='history -a'
        HISTTIMEFORMAT="%F %T "

        bind -x '"\C-g":"tmux-sessionizer"'
        bind    '"\C-o": edit-and-execute-command'
      '';
      historyControl = [ "ignoreboth" ];
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
        cp = "cp -iv";
        rm = "rm -I";
        ls = "ls --color=auto";
      };
      shellOptions = [
        "checkwinsize"
        "histappend"
      ];
    };

    # better cat
    bat = {
      enable = true;
      config = {
        pager = "less -FR";
        theme = "ansi";
      };
    };

    btop = {
      enable = true;
      settings = {
        color_theme = "adapta";
        theme_background = true;
        truecolor = true;
        force_tty = false;
        presets = "cpu:1:default,proc:0:default cpu:0:default,mem:0:default,net:0:default cpu:0:block,net:0:tty";
        vim_keys = true;
        rounded_corners = true;
        graph_symbol = "braille";
        shown_boxes = "cpu proc net mem";
        update_ms = 1000;
        proc_sorting = "memory";
        proc_reversed = false;
        proc_tree = false;
        proc_colors = true;
        proc_gradient = false;
        proc_per_core = true;
        proc_mem_bytes = true;
        proc_cpu_graphs = true;
        proc_info_smaps = false;
        proc_left = false;
        proc_filter_kernel = true;
        proc_aggregate = false;
        cpu_graph_upper = "Auto";
        cpu_graph_lower = "total";
        show_gpu_info = "Auto";
        cpu_invert_lower = true;
        cpu_single_graph = true;
        cpu_bottom = false;
        show_uptime = true;
        check_temp = true;
        cpu_sensor = "Auto";
        show_coretemp = true;
        temp_scale = "celsius";
        base_10_sizes = false;
        show_cpu_freq = true;
        clock_format = "%X";
        background_update = true;
        mem_graphs = false;
        mem_below_net = false;
        zfs_arc_cached = true;
        show_swap = true;
        swap_disk = true;
        show_disks = true;
        only_physical = true;
        use_fstab = true;
        zfs_hide_datasets = false;
        disk_free_priv = false;
        show_io_stat = true;
        io_mode = false;
        io_graph_combined = true;
        net_download = 100;
        net_upload = 100;
        net_auto = true;
        net_sync = true;
        show_battery = true;
        selected_battery = "Auto";
        log_level = "WARNING";
        nvml_measure_pcie_speeds = true;
        gpu_mirror_graph = true;
      };
    };

    # multishell completion engine
    carapace = {
      enable = true;
    };

    # tui music player
    cmus = {
      enable = true;
      extraConfig = ''
        clear
        add ~/Music/
        update-cache -f
      '';
      theme = "spotify";
    };

    # # automatic invocation of flake.nix with .envrc
    # direnv = {
    #   enable = true;
    #   nix-direnv.enable = true;
    #   config = {
    #     global = {
    #       hide_env_diff = true;
    #       warn_timeout = "30m";
    #     };
    #   };
    # };

    # fuzzy finder
    fzf = {
      enable = true;
      defaultCommand = lib.concatStrings [
        "fd"
        " --color=never"
        " --ignore-case"
        " --strip-cwd-prefix"
        " --hidden"
        " --follow"
        " --type f"
        " --type l"
        " --exclude={.git,.jj,.cache}"
      ];
      defaultOptions = [
        "--preview 'bat {} --color=always --wrap=never --style=plain --line-range=:500'"
        "--layout=reverse"
        "--multi"
        "--bind='ctrl-j:preview-page-down'"
        "--bind='ctrl-k:preview-page-up'"
        "--bind='backward-eof:abort'"
        "--bind='F4:toggle-preview'"
      ];
      historyWidgetOptions = [
        "--preview-window hidden"
        "--bind='ctrl-y:execute-silent(echo -n {2..} | wl-copy)+abort'"
        "--header 'Press CTRL-Y to copy command into clipboard'"
      ];
    };

    # github cli tool
    gh = {
      enable = true;
      settings = {
        git_protocol = "ssh";
      };
    };

    # distributed version control system
    git = {
      enable = true;
      userName = "yilisharcs";
      userEmail = "yilisharcs@gmail.com";
      aliases = {
        graph = "log --decorate --oneline --graph";
        last = "log -1 HEAD";
        unstage = "reset HEAD --";
      };
      ignores = [
        ".env"
        "/blueprint"
      ];
      extraConfig = {
        init.defaultBranch = "main";
        core.editor = "nvim";
        diff.tool = "nvimdiff";
        merge.tool = "nvimdiff";
        pull.rebase = true;
        rebase.autoStash = true;
        safe.directory = "/etc/nixos";
      };
    };

    gpg = {
      enable = true;
    };

    gnome-shell = {
      enable = true;
      extensions = with pkgs.gnomeExtensions; [
        { package = appindicator; }
        { package = clipboard-indicator; }
        { package = dash-to-dock; }
        { package = just-perfection; }
        { package = vitals; }
      ];
    };

    gnome-terminal = {
      enable = true;
      profile."a80099e0-c188-48a8-9d0c-1f8f20f2a840" = {
        default = true;
        visibleName = "yilisharcs";
        cursorShape = "block";
        showScrollbar = false;
      };
    };

  #   # git-compatible version control system
  #   jujutsu = {
  #     enable = true;
  #     settings = {
  #       user = {
  #         name = "yilisharcs";
  #         email = "yilisharcs@gmail.com";
  #       };
  #       ui = {
  #         default-command = [ "log" "--reversed" ];
  #       };
  #       aliases = {
  #         init = [ "git" "init" ];
  #       };
  #     };
  #   };

    fastfetch = {
      enable = true;
      settings = {
        modules = [
          { type = "title"; }
          { type = "separator"; }
          { type = "os"; }
          { type = "host"; }
          { type = "kernel"; }
          { type = "uptime"; }
          { type = "packages"; }
          { type = "display"; }
          { type = "de"; }
          { type = "wm"; }
          { type = "cpu"; }
          { type = "gpu"; }
          { type = "memory"; }
          { type = "disk"; }
          { type = "break"; }
          { type = "colors"; }
        ];
      };
    };

    # better find
    fd = {
      enable = true;
      hidden = true;
    };

    # lf = {
    #   enable = true;
    #   ## FIXME: previewer doesn't work
    #   # previewer = "${pkgs.ctpv}/bin/bash";
    # };

    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      extraPackages = with pkgs; [
        gcc
      ];
      withNodeJs = false;
      withPython3 = false;
      withRuby = false;
    };

    # graphical neovim client
    neovide = {
      enable = true;
      package = (config.lib.nixGL.wrap pkgs.neovide);
      settings = {
        font = {
          normal = [
            "JetBrainsMono Nerd Font"
            "Noto Color Emoji"
          ];
          size = 13;
        };
        maximized = true;
        no-multigrid = false;
        wsl = false;
      };
    };

    nushell = {
      enable = true;
      envFile.text = ''
        $env.SUDO_PROMPT = $'(ansi red_bold)[sudo](ansi reset) password for %u: '
      '';
      plugins = with pkgs.nushellPlugins; [
        gstat
        highlight #regex
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
            mode = [ "emacs" "vi_insert" "vi_normal" ];
            event = {
              send = "executehostcommand";
              cmd = "job unfreeze";
            };
          }
          {
            name = "fuzzy_history";
            modifier = "control";
            keycode = "char_r";
            mode = [ "emacs" "vi_normal" "vi_insert" ];
            event = {
              send = "executehostcommand";
              cmd = ''commandline edit --replace (
                history
                | get command
                | enumerate
                | reverse
                | group-by item
                | values
                | each {|e| $e.0}
                | each { |it| $"($it.index + 1)     ($it.item)" }
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
              )'';
            };
          }
        ];
      };
      # shellAliases = { };
    };

    # better grep
    ripgrep-all.enable = true;
    ripgrep = {
      enable = true;
      arguments = [
        "--hidden"
        "--follow"
        "--glob=!.cache/*"
        "--glob=!.git/*"
        "--glob=!.npm/*"
        "--glob=!Trash/*"
        "--smart-case"
      ];
    };

    ssh = {
      enable = true;
      addKeysToAgent = "ask";
    };

    # multishell prompt engine
    starship = let
      getPreset = name: (with builtins; removeAttrs (fromTOML (readFile
        "${pkgs.starship}/share/starship/presets/${name}.toml")) ["\"$schema\""]);
    in {
      enable = true;
      enableBashIntegration = false;
      settings =
        lib.recursiveUpdate
        (lib.mergeAttrsList [
          (getPreset "nerd-font-symbols")
        ]) {
          add_newline = false;
          command_timeout = 300;
          character = {
            success_symbol = "[➜](bold green)";
            error_symbol = "[➜](bold red)";
          };
          git_status = {
            format = lib.concatStrings [
              "([\\["
              "$all_status"
              "$ahead_behind"
              "\\]]("
              "$style"
              ") )"
            ];
            deleted = "[✕](italic red)";
          };
          package.format = "(is [󰏗 $version]($style) )";
          time = {
            disabled = false;
            format = " [$time]($style)";
            style = "yellow";
            time_format = "%a %F %T";
            use_12hr = false;
          };
          fill.symbol = " ";
          format = lib.concatStrings [
            "$all"
            "$fill"
            "$time"
            "$line_break"
            "$jobs"
            "$battery"
            "$status"
            "$os"
            "$container"
            "$netns"
            "$shell"
            "$character"
          ];
        };
    };

    # terminal multiplexer
    tmux = {
      enable = true;
      aggressiveResize = true;
      baseIndex = 1;
      clock24 = true;
      escapeTime = 0;
      focusEvents = true;
      historyLimit = 5000;
      keyMode = "emacs";
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

    # YouTube downloader
    yt-dlp = {
      enable = true;
      settings = {
        extract-audio = true;
        no-mtime = true;
        no-playlist = true;
      };
      extraConfig = ''
        -o ~/YouTube/%(title)s.%(ext)s
        -f bv*[height<=?1080]+ba/best
      '';
    };

    # zettelkasten helper
    zk = {
      enable = true;
      settings = {
        notebook = {
          dir = "~/notebook";
        };
        note = {
          language = "en";
          default-title = "Untitled";
          filename = "{{id}}-{{slug title}}";
          extension = "md";
          template = "default.md";
          id-charset = "hex";
          id-length = 9;
          id-case = "lower";
        };
        extra = {
          author = "以利沙";
        };
        group.journal = {
          paths = ["journal"];
          note.filename = "{{format-date now}}";
          note.template = "daily.md";
        };
        format.markdown = {
          link-format = "markdown";
          hashtags = true;
          colon-tags = false;
          multiword-tags = false;
        };
        tool = {
          editor = "nvim";
          # shell = "${pkgs.bash}/bin/bash";
          pager = "less -FRX";
          fzf-preview = "bat -p --color always {-1}";
        };
        lsp.diagnostics = {
          wiki-title = "hint";
          dead-link = "error";
        };
        filter = {
          recents = "--sort created- --created-after 'last two weeks'";
        };
        alias = {
          ls = "zk list $@";
          list = "zk list --quiet $@";
          editlast = "zk edit --limit 1 --sort modified- $@";
          recent = "zk edit --sort created- --created-after 'last two weeks' --interactive";
          path = "zk list --quiet --format {{path}} --delimiter , $@";
          lucky = "zk list --quiet --format full --sort random --limit 1";
          hist = "zk list --format path --delimiter0 --quiet $@ | xargs -t -0 git log --patch --";
          daily = "zk new journal --no-input";
        };
      };
    };

    # better cd
    zoxide = {
      enable = true;
    };
  };

  dconf.settings = with lib.hm.gvariant; {
    "org/gnome/GWeather4" = {
      temperature-unit = "centigrade";
    };
    "org/gnome/desktop/a11y" = {
      always-show-universal-access-status = true;
    };
    "org/gnome/desktop/a11y/interface" = {
      high-contrast = true;
      show-status-shapes = true;
    };
    "org/gnome/desktop/datetime" = {
      automatic-timezone = true;
    };
    "org/gnome/desktop/interface" = {
      accent-color = "green";
      color-scheme = "prefer-dark";
      cursor-size = 24;
      cursor-theme = "Bibata-Modern-Ice";
    };
    "org/gnome/desktop/input-sources" = {
      sources = [ (mkTuple [ "xkb" "br" ]) ];
    };
    "org/gnome/desktop/peripherals/keyboard" = {
      delay = lib.hm.gvariant.mkUint32 375;
      repeat = true;
      repeat-interval = lib.hm.gvariant.mkUint32 18;
    };
    "org/gnome/desktop/peripherals/keyboard" = {
      edge-scrolling-enabled = true;
      natural-scroll = false;
      two-finger-scrolling-enabled = false;
    };
    "org/gnome/desktop/sound" = {
      allow-volume-above-100-percent = true;
    };
    "org/gnome/desktop/wm/preferences" = {
      move-to-workspace-left = [ "<Shift><Super>minus" ];
      move-to-workspace-right = [ "<Shift><Super>equal" ];
      switch-to-workspace-left = [ "<Super>minus" ];
      switch-to-workspace-right = [ "<Super>equal" ];
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,close";
      focus-mode = "sloppy";
    };
    "org/gnome/evince/default" = {
      inverted-colors = true;
      show-sidebar = false;
      sizing-mode = "fit-width";
    };
    "org/gnome/evolution/calendar" = {
      use-24hour-format = true;
    };
    "org/gnome/evolution/mail" = {
      composer-magic-smileys = true;
      composer-unicode-smileys = true;
      image-loading-policy = "always";
      layout = 1;
      message-list-sort-on-header-click = "always";
      show-animated-images = true;
      show-to-do-bar = false;
    };
    "org/gnome/evolution/plugin/external-editor" = {
      command = "neovide -- -c 'set spell'";
      launch-on-key-press = true;
    };
    "org/gnome/evolution/shell" = {
      icon-only-buttons-in-header-bar = true;
      statusbar-visible = false;
      webkit-minimum-font-size = 16;
    };
    "org/gnome/Loupe" = {
      show-properties = true;
    };
    "org/gnome/mutter" = {
      center-new-windows = true;
    };
    "org/gnome/nautilus/preferences" = {
      click-policy = "single";
    };
    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = false; # TODO: set to true later
      night-light-schedule-automatic = false;
    };
    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "nothing";
    };
    "org/gnome/shell" = {
      favorite-apps = [
        "neovide.desktop"
        "org.gnome.Evolution.desktop"
        "brave-browser.desktop"
        "gimp.desktop"
        "org.gnome.Nautilus.desktop"
      ];
      last-selected-power-profile = "performance";
    };
    "org/gnome/shell/extensions/appindicator" = {
      icon-size = 20;
    };
    "org/gnome/shell/extensions/clipboard-indicator" = {
      clear-on-boot = false;
      disable-down-arrow = true;
      display-mode = 2;
      keep-selected-on-clear = true;
      move-item-first = true;
      notify-on-copy = false;
      notify-on-cycle = false;
      private-mode-binding = [ "<Control>F8" ];
      topbar-preview-size = 11;
    };
    "org/gnome/shell/extensions/dash-to-dock" = {
      background-opacity = 0.80000000000000004;
      dash-max-icon-size = 48;
      dock-position = "BOTTOM";
      height-fraction = 0.90000000000000002;
      intellihide-mode = "ALL_WINDOWS";
      multi-monitor = true;
      preferred-monitor = -2;
      preferred-monitor-by-connector = "LVDS-1";
    };
    "org/gnome/shell/extensions/just-perfection" = {
      accent-color-icon = true;
      max-displayed-search-results = 0;
      power-icon = false;
    };
    "org/gnome/shell/extensions/vitals" = {
      hide-zeros = false;
      hot-sensors = [
        "_memory_usage_"
        "_system_load_1m_"
        "__network-rx_max__"
        "_storage_free_"
      ];
      icon-style = 1;
      menu-centered = true;
      position-in-panel = 0;
      show-battery = false;
      show-fan = false;
      use-higher-precision = false;
    };
    "org/gnome/shell/weather" = {
      automatic-location = true;
    };
    "org/gnome/terminal/legacy" = {
      menu-accelerator-enabled = false;
    };
    "org/gtk/gtk4/settings/file-chooser" = {
      show-hidden = true;
    };
    "org/gtk/settings/file-chooser" = {
      show-hidden = true;
      sort-directories-first = true;
    };
  };

  editorconfig = {
    enable = true;
    settings = {
      "*" = {
        charset = "utf-8";
        end_of_line = "lf";
        insert_final_newline = true;
        trim_trailing_whitespace = true;
      };
    };
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/pdf" = "org.gnome.Evince.desktop";
      "image/png" = "org.gnome.Loupe.desktop";
      "x-scheme-handler/mailto" = "userapp-Evolution-I70E62.desktop";
    };
    associations = {
      added = {
        "application/x-zerosize" = "neovide.desktop";
      };
    };
  };

  xdg.autostart = {
    enable = true;
    entries = [
      "${pkgs.neovide}/share/applications/neovide.desktop"
      # "${pkgs.brave}/share/applications/brave-browser.desktop" #autostarts with wrong font
      # "${pkgs.evolution}/share/applications/org.gnome.Evolution.desktop"
      "/usr/share/applications/org.gnome.Evolution.desktop"
    ];
  };

  ## TODO: does gnome-keyring take care of this?
  # services = {
  #   gpg-agent = {
  #     enable = true;
  #     enableSshSupport = true;
  #   };
  # };

  systemd.user = {
    enable = true;
    services = {
      "ra-mux" = {
        Unit = {
          Description = "Rust-analyzer Multiplex Server";
          After = [ "graphical-session.target" ];
          PartOf = [ "graphical-session.target" ];
        };
        Install = {
          # NOTE: doesn't work with default.target
          WantedBy = [ "graphical-session.target" ];
        };
        Service = {
          Type = "simple";
          ExecStart = "${pkgs.ra-multiplex}/bin/ra-multiplex server";
          ExecReload = "${pkgs.ra-multiplex}/bin/ra-multiplex reload";
          Restart = "always";
        };
      };
    };
  };

  # Enable Syncthing for peer-to-peer file sync
  services.syncthing = {
    enable = true;
    overrideDevices = true;
    overrideFolders = true;
    settings = {
      devices = {
        "samsumg" = {
          id = "MF6IH63-BX3WP45-ZH42ZJM-ZKA45EZ-JNDUF5L-ZDLO5KH-H5B6XRJ-O4CTEQW";
        };
      };
      folders = {
        "notebook" = {
          enable = true;
          devices = [ "samsumg" ];
          id = "notebook";
          path = "~/notebook";
        };
        "vault" = {
          enable = true;
          devices = [ "samsumg" ];
          id = "vault";
          path = "~/vault";
        };
      };
      options = {
        localAnnounceEnabled = true;
        urAccepted = 3;
      };
    };
  };
}
