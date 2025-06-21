{
  pkgs,
  ...
}:

{
  # FIXME: This piece of shit garbage is completely unreliable and I
  # have no idea how or why it's working. It'll probably break again
  # in a week. Remove ASAP and look for alternatives.
  # NOTE: Had to generate an ssh key in seahorse itself...
  # NOTE: Auth dialog window doesn't pop up on COSMIC DE: if keyring
  # is locked, you can't unlock it. Sucks to suck, I guess!
  home.packages = [
    pkgs.seahorse
    pkgs.gcr
  ];

  services.gnome-keyring.enable = true;
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
  };

  home.sessionVariables = {
    SSH_AUTH_SOCK = "/run/user/1000/keyring/ssh";
  };
}
