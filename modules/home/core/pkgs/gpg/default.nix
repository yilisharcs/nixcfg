{
  pkgs,
  ...
}:

{
  programs.gpg = {
    enable = true;
    mutableKeys = true;
    mutableTrust = true;
    settings = {
      keyid-format = "none";
    };
  };

  services.gpg-agent = {
    enable = true;
    # enableSshSupport = true;
    pinentry.package = pkgs.pinentry-tty;
  };
}
