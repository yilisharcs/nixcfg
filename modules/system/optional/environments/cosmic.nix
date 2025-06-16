{
  pkgs,
  ...
}:

{
  imports = [
    ./common
  ];

  services = {
    desktopManager.cosmic.enable = true;
  };

  environment.cosmic.excludePackages = with pkgs; [
    cosmic-edit
    cosmic-player
    cosmic-term
  ];
}
