{
  pkgs,
  ...
}:

{
  home.packages = [
    pkgs.mask     # Markdown task runner
  ];

  home.shellAliases = {
    mask = "maskfile.nu";
  };

  home.file.".local/bin/maskfile.nu" = {
    source = ./maskfile.nu;
  };
}
