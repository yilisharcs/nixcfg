let
  username = "yilisharcs";
in

{
  # Declare the user
  users.users.${username} = {
    initialHashedPassword = "$y$j9T$grKbKdksAB0H5ZVcqvDmA.$xFjkCjD1sMaN5J51tEipJHlAFqOwdqzcec02PcmLBy1";
    isNormalUser = true;
    description = "${username}";
    extraGroups = [
      # Sudo
      "wheel"

      # TODO: configure virtualization properly
      # Virtual Machines
      "kvm"
      "libvirtd"

      # Internet
      "networkmanager"
    ];
  };

  # Import user-specific configuration
  home-manager.users.${username} = import ./home.nix;
}
