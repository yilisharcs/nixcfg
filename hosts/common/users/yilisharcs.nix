{ config, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.yilisharcs = {
    hashedPassword = "$y$j9T$grKbKdksAB0H5ZVcqvDmA.$xFjkCjD1sMaN5J51tEipJHlAFqOwdqzcec02PcmLBy1";
    isNormalUser = true;
    description = "yilisharcs";
    extraGroups = [
      "networkmanager"
      "wheel"            # Enable ‘sudo’ for the user.
      "kvm"
      "libvirt"
    ];
  };
  home-manager.users.yilisharcs =
    import ../../../home/yilisharcs/${config.networking.hostName}.nix;
}
