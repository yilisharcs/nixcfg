{
  pkgs,
  ...
}:

{
  imports = [
    ./common.nix
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
}
