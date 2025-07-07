{
  config,
  lib,
  pkgs,
  username,
  ...
}:

{
  imports = [
    ../common.nix
    ./nvim
    ./projects
    ./qbittorrent
    ./syncthing
    # ./systemd-backup
    ./vcs
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = lib.mkDefault username;
  home.homeDirectory = lib.mkDefault "/home/${username}";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # NOTE: Only necessary because the Determinate NixOS iso ships with 25.11
  home.enableNixpkgsReleaseCheck = false;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')

    gemini-cli

    # # ldtk                           # lightweight level editor
    #
    #
    # # dev libs and tools
    # # hyperfine                      # cmdline benchmarking tool
    # # mprocs                         # parallel command runner
  ];

  # xdg.mimeApps = {
  #   enable = true;
  #   defaultApplications = {
  #     # NOTE: Evolution-(ID) changes on switching machines
  #     # "x-scheme-handler/mailto" = "userapp-Evolution-I70E62.desktop";
  #   };
  # };

  # xdg.autostart = {
  #   enable = true;
  #   entries = [
  #     "${config.home.homeDirectory}/.local/state/nix/profiles/home-manager/home-path/share/applications/nvim.desktop"
  #     "${pkgs.brave}/share/applications/brave-browser.desktop"
  #     "${pkgs.evolution}/share/applications/org.gnome.Evolution.desktop"
  #   ];
  # };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/yilisharcs/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
