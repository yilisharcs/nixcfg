{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    pciutils         # Provides `lspci`
    libva-utils      # Provides `vainfo`
  ];
}
