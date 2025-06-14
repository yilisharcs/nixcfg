{
  pkgs,
  ...
}:

{
  programs = {
    taskwarrior = {
      enable = true;
      package = pkgs.taskwarrior3;
      colorTheme = "solarized-dark-256";
      dataLocation = "$HOME/notebook/.task";
      config = {
        alias.ro = "project:Routine list";
        default.command = "project.not:Routine next";
        allow.empty.filter = 0;
        column.padding = 2;
        confirmation = 1;
        defaultwidth = 120;
        detection = 1;
        search.case.sensitive = 0;
        report = {
          list.dateformat = "Y-M-D H:N";
        };
      };
    };
  };
}
