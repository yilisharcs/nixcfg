# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  ...
}:

# let
#   unstable = import <nixos-unstable> { config = config.nixpkgs.config; };
# in
{
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Documentation.
  documentation = {
    dev.enable = true;
    doc.enable = true;
    info.enable = true;
    man.enable = true;
    nixos.enable = true;
  };

  networking.hostName = "nixos"; # Define your hostname.
  # NOTE: Only needed if networkmanager is disabled
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Bahia";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # i18.inputMethod.enable = true; # like fcitx5

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure console keymap
  console.useXkbConfig = true;
  #console.keyMap = "br-abnt2";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "br";
    variant = "";
    # extraLayouts = {
    #   br = {
    #     description = "Custom brazilian keyboard";
    #     languages = [ "br" ];
    #     symbolsFile = "/home/yilisharcs/.dotfiles/xkb/symbols/br";
    #   };
    # };
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts-emoji
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable Syncthing for peer-to-peer file sync
  services.syncthing = {
    enable = true;
    systemService = true;
    user = "yilisharcs";
    dataDir = "${config.users.users.yilisharcs.home}";
    overrideDevices = true;
    settings = {
      devices = {
        "samsumg" = {
          id = "MF6IH63-BX3WP45-ZH42ZJM-ZKA45EZ-JNDUF5L-ZDLO5KH-H5B6XRJ-O4CTEQW";
          autoAcceptFolders = true;
        };
      };
      folders = {
        "notebook" = {
          enable = true;
          devices = [ "samsumg" ];
          path = "~/notebook";
        };
      };
      options = {
        localAnnounceEnabled = true;
        urAccepted = 3;
      };
    };
  };

  programs = {
    chromium = {
      enable = true;
      defaultSearchProviderEnabled = true;
      defaultSearchProviderSearchURL = "https://duckduckgo.com/?q={searchTerms}&t=brave";
      extensions = [
        "eimadpbcbfnmbkopoojfekhnkhdbieeh" # Dark reader
        "cofdbpoegempjloogbagkncekinflcnj" # DeepL
        "ghmbeldphafepmbegfdlkpapadhbakde" # Proton Pass
        "eninkmbmgkpkcelmohdlgldafpkfpnaf" # Reddit Untranslate
        "fakeocdnmmmnokabaiflppclocckihoj" # Sprucemarks
        "dbepggeogbaibhgnhhndojpepiihcmeb" # Vimium
        "kkmlkkjojmombglmlpbpapmhcaljjkde" # Zhongwen: Zh-En Dictionary
      ];
      extraOpts = {
        # Extensions
        ExtensionSettings = {
          # Dark reader
          "eimadpbcbfnmbkopoojfekhnkhdbieeh" = {
            toolbar_pin = "force_pinned";
            file_url_navigation_allowed = true;
          };
          # Proton Pass
          "ghmbeldphafepmbegfdlkpapadhbakde" = {
            toolbar_pin = "force_pinned";
          };
          # # Sprucemarks
          # "fakeocdnmmmnokabaiflppclocckihoj" = {
          #   options_ui = {
          #     page = "dark.html";
          #   };
          # };
          # Vimium
          "dbepggeogbaibhgnhhndojpepiihcmeb" = {
            toolbar_pin = "force_pinned";
            file_url_navigation_allowed = true;
          };
          # Zhongwen: Zh-En Dictionary
          "kkmlkkjojmombglmlpbpapmhcaljjkde" = {
            toolbar_pin = "force_pinned";
          };
        };

        # Generative AI
        GenAiDefaultSettings = 2;

        # Miscellaneous
        AllowDinosaurEasterEgg = false;
        AllowSystemNotifications = true;
        BookmarkBarEnabled = false;
        BrowserThemeColor = "#128470"; # get color from windows
        DefaultBrowserSettingEnabled = true;
        DeveloperToolsAvailability = 1;
        SpellcheckEnabled = true;
        SpellcheckLanguage = [
          "en"
          "pt-BR"
        ];

        # Password manager
        PasswordManagerEnabled = false;

        # Safe Browsing settings
        DisableSafeBrowsingProceedAnyway = false;
        SafeBrowsingProtectionLevel = 1;

        # Startup, Home page and New Tab page
        RestoreOnStartup = 1;
        ShowHomeButton = true;
      };
    };
    firefox.enable = false; # default browser for all users

    # distributed version control system
    git = {
      enable = true;
      config = {
        init.defaultBranch = "main";
        core.editor = "nvim";
        diff.tool = "nvimdiff";
        merge.tool = "nvimdiff";
        pull.rebase = true;
        rebase.autoStash = true;
        safe.directory = "/etc/nixos";
      };
    };

    gnupg.agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-gnome3;
    };

    # pager utility
    less = {
      enable = true;
      envVariables = {
        LESS = "-FRX";
      };
    };

    # extensible text editor
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };

    # multishell prompt engine
    starship = {
      enable = true;
      presets = [ "nerd-font-symbols" ];
    };

    # terminal multiplexer
    tmux = {
      enable = true;
      aggressiveResize = true;
      baseIndex = 1;
      clock24 = true;
      escapeTime = 0;
      historyLimit = 5000;
      keyMode = "emacs";
      newSession = true;
      shortcut = "t";
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
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    atool                          # compression and extraction tools
    bibata-cursors
    brave                          # chromium fork with built-in adblocker
    curl
    gnome-terminal
    lf                             # tui file explorer
    man                            # man command
    ncdu                           # disk space analyzer
    nushell
    pinentry-gnome3                # gnupg deps
    unzip                          # required by atool
    wget
    wl-clipboard
    xclip
  ];

  environment.gnome.excludePackages = with pkgs; [
    gnome-console                  # terminal emulator (https://gitlab.gnome.org/GNOME/console/-/issues/135)
    epiphany                       # web browser
    geary                          # mail client
  ];

  # this doesn't add ~/.local/bin to PATH
  # it ads ~/.local/state/nix/profile/bin instead
  # environment.localBinInPath = true;

  environment.variables = {
    SUDO_EDITOR = "nvim";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
