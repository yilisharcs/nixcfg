{
  config,
  lib,
  ...
}:

{
  home.activation = {
    mkLocalBinDir = lib.hm.dag.entryAfter ["writeBoundary"] ''
      run mkdir -p "${config.home.homeDirectory}/.local/bin"
    '';
  };

  # # TODO: this and the script aliases
  # # should be their own module
  # home.file.".local/bin" = {
  #   recursive = true;
  #   source = ./bin;
  # };

  home.shellAliases = {
    gitcon   = "gitcon.nu";
    gitlist  = "gstat.nu";
    tokeicon = "tokeicon.nu";
    wut      = "helpless.nu";
  };
}
