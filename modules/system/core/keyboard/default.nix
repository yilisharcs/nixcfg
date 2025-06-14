{
  lib,
  pkgs,
  ...
}:

{
  # Configure keymap in X11
  services.xserver.xkb = lib.mkDefault {
    layout = "br,us";
    options = "terminate:ctrl_alt_bksp";
  };

  # console = {
  #   font = "Lat2-Terminus16";
  # };

  # NOTE@KEYBOARD Home Manager manages the symbols file at ../../../home/core/xkb
  # FIXME: consolidate all keyboard configuration into this file

  environment.systemPackages = [pkgs.keyd];

  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = ["*"];
        settings = {
          main = {
            "102nd" = "leftshift";
            capslock = "layer(control)";
          };
          "shift:S".capslock = "capslock";
          # Common terminal experience for GUI apps
          "control:C" = {
            "[" = "esc";
            i = "tab";
            m = "enter";
          };
        };
      };
    };
  };

}
