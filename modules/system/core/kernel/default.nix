{
  pkgs,
  ...
}:

{
  boot.kernelPackages =
    pkgs.linuxPackages;
  # pkgs.linuxPackages_latest;
}
