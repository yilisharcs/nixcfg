{
  config,
  ...
}:

{
  # # FIXME: This is incomplete and won't work
  # systemd.user = {
  #   services.hddBackupHome = {
  #     Unit = {
  #       Description = "Backup of select /home files with rsync";
  #     };
  #     Service = {
  #       Type = "";
  #       ExecStart = "${config.home.homeDirectory}/.local/bin/rsyncit.nu";
  #     };
  #     Install.WantedBy = [""];
  #   };
  #   timers.hddBackupHome = {};
  # };
}
