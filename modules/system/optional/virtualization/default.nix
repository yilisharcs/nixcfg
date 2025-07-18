{
  pkgs,
  ...
}:

{
  environment.systemPackages = [
    pkgs.virtiofsd
  ];

  programs.virt-manager.enable = true;

  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
    vmVariant.virtualisation = {
      memorySize = 8192; # Use 8GB memory
      cores = 3;
    };
  };

  # NOTE: To enable this persistently, run this
  # command: `sudo virsh net-autostart default`
}
