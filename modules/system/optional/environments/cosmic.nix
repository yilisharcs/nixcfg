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

  # };
  # # NOTE: COSMIC Utilities - Clipboard Manager not working?
  # environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;

  environment.cosmic.excludePackages = with pkgs; [
    cosmic-edit
    cosmic-player
    cosmic-term
  ];
}
