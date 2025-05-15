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

  # # Install firefox.
  # programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    # home-manager # try to use it as a flake instead?
    bibata-cursors
    curl
    git                            # distributed version control system
    man                            # man command
    neovim                         # extensible text editor
    nushell
    wget
    xclip
  ];

  environment.gnome.excludePackages = with pkgs; [
    epiphany                       # web browser
  ];

  # this doesn't add ~/.local/bin to PATH
  # it ads ~/.local/state/nix/profile/bin instead
  # environment.localBinInPath = true;

  # # this only works for bash idk why
  # environment.shellAliases = {
  #   ":q" = "exit";
  #   cp = "cp -iv";
  #   rm = "rm -I";
  #   visudo = "sudo visudo";
  # };

  # FIXME this is wrong
  # environment.variables = {
  #   SUDO_EDITOR = "nvim";
  #   EDITOR = "nvim"; # this makes lf call neovide instead of opening a nested vim session; <e> still broken
  #   VISUAL = "nvim";
  #   # LESS = "-FRX"; # FIXME: doesn't appear to work
  #   # MANPAGER = "nvim +Man!"; # FIXME: doesn't appear to work
  #   # RIPGREP_CONFIG_PATH = "$XDG_CONFIG_HOME/ripgrep/ripgreprc";
  #   # SKIM_DEFAULT_COMMAND = "fd --color=never --hidden --follow --type f --type l --exclude .git"; # FIXME: doesn't appear to work
  #   #   SKIM_DEFAULT_OPTIONS = "--bind='ctrl-j:preview-page-down,ctrl-k:preview-page-up' \
  #   # --layout=reverse --multi --bind='F4:toggle-preview,ctrl-h:backward-char+delete-charEOF' \
  #   # --preview 'bat {} --color=always --wrap=never --style=plain --line-range=:500'";
  #   # SQLITE_HISTORY = "$HOME/.local/state/sqlite3/sqlite_history";
  #   STARSHIP_LOG = "error";
  #   # ZK_NOTEBOOK_DIR = "$HOME/notebook";
  #   # XDG_CONFIG_HOME = "$HOME/.config";
  # };

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
