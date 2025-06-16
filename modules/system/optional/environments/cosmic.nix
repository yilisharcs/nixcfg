{
  pkgs,
  ...
}:

{
  imports = [
    ./common.nix
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
