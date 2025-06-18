{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    ra-multiplex
  ];

  systemd.user.services."ra-mux" = {
    Unit = {
      Description = "Rust-analyzer Multiplex Server";
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.ra-multiplex}/bin/ra-multiplex server";
    };
    Install = {
      WantedBy = ["default.target"];
    };
  };
}
