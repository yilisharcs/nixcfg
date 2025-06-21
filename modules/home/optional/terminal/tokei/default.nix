{
  pkgs,
  ...
}:

{
  # LoC counter
  home.packages = [
    pkgs.tokei
  ];

  home.shellAliases = {
    tokeicon = "tokeicon.nu";
  };

  home.file.".local/bin/tokeicon.nu".source = ./tokeicon.nu;
}
