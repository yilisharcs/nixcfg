{
  config,
  lib,
  ...
}:

{
  imports = [
    ../home/core
    ../home/optional/terminal
    ../home/optional/desktop
  ];

  home.activation = {
    symLinks = lib.hm.dag.entryAfter ["writeBoundary"] ''
      run ln -sf "${config.home.homeDirectory}/.local/share/Trash/files" "${config.home.homeDirectory}/Trash"
      run ln -sf "${config.home.homeDirectory}/.config/nushell/history.txt" "${config.home.homeDirectory}/.nu_history"
    '';
  };
}
