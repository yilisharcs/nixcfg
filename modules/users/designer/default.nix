let
  username = "designer";
in

{
  # Declare the user
  users.users.${username} = {
    initialHashedPassword = "$y$j9T$GOgZ2Rjl.XusdSoVf.iiQ1$CgT/h6a22cpYTIHUkf5I3FG5.BAFtd.aI15duVybcb3";
    isNormalUser = true;
    description = "${username}";
    extraGroups = [
      # # Sudo
      # "wheel"
      #
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
