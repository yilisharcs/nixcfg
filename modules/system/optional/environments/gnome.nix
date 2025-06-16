{
  pkgs,
  ...
}:

{
  imports = [
    ./common
  ];

  services = {
    desktopManager.gnome.enable = true;
  };

  environment.gnome.excludePackages = with pkgs; [
    epiphany         # Web browser
    geary            # Mail client
    totem
  ];
}
