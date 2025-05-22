{ config, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.yilisharcs = {
    # initialHashedPassword = "$y$j9T$Fs0yyOMNtsNrMGuB.CCRD0$8Lb.ND9t.Nfe5WpExqrDFDCdvX8NGuT6pS1balITiA3";
    isNormalUser = true;
    description = "yilisharcs";
    extraGroups = [
      "networkmanager"
      "wheel"
      "kvm"
      "libvirt"
    ];
  };
  home-manager.users.yilisharcs =
    import ../../../home/yilisharcs/${config.networking.hostName}.nix;
}
