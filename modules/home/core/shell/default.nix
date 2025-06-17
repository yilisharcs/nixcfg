{
  pkgs,
  ...
}:

{
  imports = [
    ./bash
    ./nushell
  ];

  home.shellAliases = {
    ":q" = "exit";
    nsp  = "nix search nixpkgs";
  };
}
