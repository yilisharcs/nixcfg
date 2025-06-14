{
  # Enable Syncthing for peer-to-peer file sync
  services.syncthing = {
    enable = true;
    overrideDevices = true;
    overrideFolders = true;
    settings = {
      devices = {
        "samsumg" = {
          id = "MF6IH63-BX3WP45-ZH42ZJM-ZKA45EZ-JNDUF5L-ZDLO5KH-H5B6XRJ-O4CTEQW";
        };
      };
      folders = {
        "notebook" = {
          enable = true;
          devices = ["samsumg"];
          id = "notebook";
          path = "~/notebook";
        };
        "vault" = {
          enable = true;
          devices = ["samsumg"];
          id = "vault";
          path = "~/vault";
        };
      };
      options = {
        localAnnounceEnabled = true;
        urAccepted = 3;
      };
    };
  };
}
