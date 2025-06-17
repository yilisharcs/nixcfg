{
  config,
  pkgs,
  ...
}:

{
  home.packages = [
    pkgs.sqlite
  ];

  home.sessionVariables = {
    SQLITE_HISTORY = "${config.home.homeDirectory}/.local/state/sqlite3/sqlite_history";
  };
}
