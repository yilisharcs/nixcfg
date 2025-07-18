{
  pkgs,
  ...
}:

{
  # CLI markdown renderer
  home.packages = [
    pkgs.glow
  ];

  home.file.".config/glow/glow.yml".source = ./glow.yml;
}
