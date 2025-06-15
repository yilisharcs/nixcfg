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
      run ln -sf "/run/current-system/sw/bin/kitty" "${config.home.homeDirectory}/.local/bin/cosmic-term"
    '';
    # Necessary until there's a way to change the default terminal.
    # NOTE: the kitty symlink can fail if ~/.local/bin/ doesn't exist.
    # TODO: figure out how to create empty directories with nix
  };
}
