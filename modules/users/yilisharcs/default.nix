let
  username = "yilisharcs";
in

{
  # Declare the user
  users.users.${username} = {
    initialPassword = "senha";
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
