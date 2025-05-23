All this goes into /etc/nix/configuration.nix, which
I currently don't have because this is Determinate Nix
---

```nix
# Configure console keymap
console.useXkbConfig = true;
#console.keyMap = "br-abnt2";

# Configure keymap in X11
services.xserver.xkb = {
  layout = "br";
  variant = "";
};


# Without a handler, any application that
# requires user authentication will fail
programs = {
  gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-gnome3;
  };
};


# gparted is an essential program, trust me
environment.systemPackages = with pkgs; [
  gparted
];

# But these ones aren't
environment.gnome.excludePackages = with pkgs; [
  gnome-console                  # terminal emulator (https://gitlab.gnome.org/GNOME/console/-/issues/135)
  epiphany                       # web browser
  geary                          # mail client
];
```
