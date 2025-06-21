{
  pkgs,
  ...
}:

{
  # Disk space analyzer
  home.packages = [
    pkgs.gdu
  ];

  home.file.".config/gdu/gdu.yaml".source = ./gdu.yaml;
}
