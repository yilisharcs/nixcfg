{
  pkgs,
  ...
}:

{
  # Nix-ld is a practical module to have enabled for a more "traditional"
  # experience in NixOS by recreating the loaders like /lib/ld-linux.so.2,
  # needed to run any executable that is not patched by nix.
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      # Put here any library that is required when running a package
      # Documentation: https://wiki.nixos.org/wiki/Nix-ld
    ];
  };
}
