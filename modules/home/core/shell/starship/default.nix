{
  lib,
  pkgs,
  ...
}:

{
  home.sessionVariables = {
    STARSHIP_LOG = "error";
  };

  programs = {
    # multishell prompt engine
    starship = let
      getPreset = name: (with builtins; removeAttrs (fromTOML (readFile
        "${pkgs.starship}/share/starship/presets/${name}.toml")) [''"$schema"'']);
    in {
      enable = true;
      enableBashIntegration = false;
      settings =
        lib.recursiveUpdate
        (lib.mergeAttrsList [
          (getPreset "nerd-font-symbols")
        ])
      {
        add_newline = false;
        command_timeout = 300;
        character = {
          success_symbol = "[\\$](bold green)";
          error_symbol = "[\\$](bold red)";
        };
        git_status = {
          format = lib.concatStrings [
            "([\\["
            "$all_status"
            "$ahead_behind"
            "\\]]("
            "$style"
            ") )"
          ];
          deleted = "[✕](italic red)";
        };
        package.format = "(is [󰏗 $version]($style) )";
        time = {
          disabled = false;
          format = "\\[[$time]($style)\\]";
          style = "bold yellow";
          time_format = "%H:%M";
          use_12hr = false;
        };
        fill.symbol = " ";
        format = lib.concatStrings [
          "$all"
          "$shell"
          "$time"
          "$character"
        ];
      };
    };
  };
}
