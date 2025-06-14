{
  pkgs,
  ...
}:

{
  imports = [
    ./common.nix
  ];

  # TODO: include useful GNOME packages
  environment.systemPackages = with pkgs; [
    dconf-editor
    gnome-tweaks     # Advanced GNOME settings editor
  ];

  services = {
    desktopManager.gnome.enable = true;
    # displayManager.gdm.enable = true;
  };

  environment.gnome.excludePackages = with pkgs; [
    epiphany         # Web browser
    geary            # Mail client
    totem
  ];

  # Home Manager manages GNOME extensions at ../../../home/optional/desktop/gnome-shell-extensions
  # FIXME@GNOME-shell-ext: consolidate all extension configuration into this file somehow
}
