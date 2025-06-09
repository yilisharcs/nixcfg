# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  # boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "America/Bahia";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # i18.inputMethod.enable = true; # like fcitx5
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

  # Enable the GNOME Desktop Environment.
  services = {
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
  };

  environment.sessionVariables = {
    GSK_RENDERER = "opengl"; # NOTE: GNOME/Wayland breaks without this
    NIXOS_OZONE_WL = "1";    # Support for Chromium/Electron apps without XWayland
  };

  programs.dconf.profiles.user.databases = [
    {
      settings = with lib.gvariant; {
        "org/gnome/Console" = {
          custom-font = "JetBrainsMono Nerd Font 10";
        };
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
          cursor-size = mkUint32 24;
          cursor-theme = "Bibata-Modern-Ice";
          document-font-name = "Cantarell 11";
          font-name = "Cantarell 11";
        };
        "org/gnome/desktop/input-sources" = {
          sources = [(mkTuple ["xkb" "br"])];
        };
        "org/gnome/desktop/peripherals/keyboard" = {
          delay = mkUint32 375;
          repeat = true;
          repeat-interval = mkUint32 18;
        };
        "org/gnome/desktop/peripherals/keyboard" = {
          edge-scrolling-enabled = true;
          natural-scroll = false;
          two-finger-scrolling-enabled = false;
        };
        "org/gnome/desktop/sound" = {
          allow-volume-above-100-percent = true;
        };
        "org/gnome/desktop/wm/keybindings" = {
          move-to-workspace-left = ["<Shift><Super>minus"];
          move-to-workspace-right = ["<Shift><Super>equal"];
          switch-to-workspace-left = ["<Super>minus"];
          switch-to-workspace-right = ["<Super>equal"];
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
        # "org/gnome/evolution/calendar" = {
        #   use-24hour-format = true;
        # };
        # "org/gnome/evolution/mail" = {
        #   composer-magic-smileys = true;
        #   composer-unicode-smileys = true;
        #   image-loading-policy = "always";
        #   layout = mkUint32 1;
        #   message-list-sort-on-header-click = "always";
        #   show-animated-images = true;
        #   show-to-do-bar = false;
        # };
        # "org/gnome/evolution/plugin/external-editor" = {
        #   command = "neovide -- -c 'set spell' -c 'startinsert'";
        #   launch-on-key-press = true;
        # };
        # "org/gnome/evolution/shell" = {
        #   icon-only-buttons-in-header-bar = true;
        #   statusbar-visible = false;
        #   webkit-minimum-font-size = mkUint32 16;
        # };
        "org/gnome/Loupe" = {
          show-properties = false;
        };
        "org/gnome/mutter" = {
          center-new-windows = true;
        };
        "org/gnome/nautilus/preferences" = {
          click-policy = "single";
          show-hidden-files = true;
        };
        "org/gnome/nautilus/compression" = {
          default-compression-format = "tar.xz";
        };
        "org/gnome/settings-daemon/plugins/power" = {
          sleep-inactive-ac-type = "nothing";
        };
        "org/gnome/shell" = {
          favorite-apps = [
            "neovide.desktop"
            "org.gnome.Evolution.desktop"
            "brave-browser.desktop"
            "org.inkscape.Inkscape.desktop"
            "org.gnome.Calendar.desktop"
            "org.gnome.Music.desktop"
            "org.gnome.Nautilus.desktop"
          ];
          last-selected-power-profile = "performance";
        };
        # "org/gnome/shell/weather" = {
        #   automatic-location = true;
        # };
        "org/gtk/gtk4/settings/file-chooser" = {
          show-hidden = true;
        };
        "org/gtk/settings/file-chooser" = {
          show-hidden = true;
          sort-directories-first = true;
        };
      };
    }
  ];

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    options = "terminate:ctrl_alt_bksp,ctrl:swapcaps";
  };

  console = {
    # font = "Lat2-Terminus16";
    # keyMap = "br";
    useXkbConfig = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-ocl
      intel-vaapi-driver
      mesa                  # https://nixos.wiki/wiki/OpenGL
      vpl-gpu-rt            # https://nixos.wiki/wiki/Intel_Graphics
    ];
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
  services.libinput.enable = false;

  fonts = {
    # enableDefaultPackages = true;
    packages = with pkgs; [
      cantarell-fonts
      nerd-fonts.jetbrains-mono
      noto-fonts-emoji
    ];
    # TODO: figure out how to render
    # emoji in brave tabs/cards
    fontconfig = {
      enable = true;
      useEmbeddedBitmaps = true;
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.yilisharcs = {
    isNormalUser = true;
    description = "yilisharcs";
    extraGroups = [
      "networkmanager"
      "wheel" # Enable ‘sudo’ for the user.
    ];
    # packages = with pkgs; [
    # #  thunderbird
    # ];
  };

  # Install firefox.
  # programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs = {
    # Version control system
    git = {
      enable = true;
      config = {
        init.defaultBranch = "main";
        core.editor = "nvim";
        diff.tool = "nvimdiff";
        merge.tool = "nvimdiff";
        safe.directory = "/etc/nixos";
      };
    };

    # Text editor
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
    };
  };

  # users.groups.libvirtd.members = ["yilisharcs"];
  # virtualisation.libvirtd.enable = true;
  # virtualisation.spiceUSBRedirection.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # GUI user packages
    bibata-cursors
    brave            # Chromium browser
    dconf-editor
    evolution        # Mail client
    inkscape         # Vector graphics editor
    gnome-tweaks     # Advanced GNOME settings editor
    gparted          # Partition manager
    neovide          # Neovim client

    # Terminal packages
    bat              # Better cat
    curl             # CLI featureful downloader
    entr             # Event Notify Test Runner
    fd               # Better find
    file
    fzf              # Fuzzy finder
    gdu              # Disk space analyzer
    kitty            # Modern terminal emulator with image support
    mask             # Task runner with markdown
    nushell          # A modern shell
    ripgrep          # Better grep
    stow             # Symlink manager
    time             # Simple command stopwatch
    tree             # Intended directory list
    tmux             # Terminal multiplexer
    wget             # CLI recursive downloader
    wl-clipboard     # Wayland clipboard utility
    xclip            # X11 clipboard utility
    yazi             # File manager

    # Compression/extraction utility and dependencies
    ouch
    unrar
    zstd
  ];

  environment.gnome.excludePackages = with pkgs; [
    epiphany         # Web browser
    geary            # Mail client
  ];

  # NOTE: conjecture: setting a different user shell
  # (e.g. nushell) might break the below options
  environment.localBinInPath = true;
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

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.11"; # Did you read the comment?
}
