{
  pkgs,
  ...
}:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      # https://nixos.wiki/wiki/OpenGL
      mesa
      ## https://nixos.wiki/wiki/Intel_Graphics
      intel-media-sdk
      intel-media-driver # OR vpl-gpu-rt
      intel-vaapi-driver
    ];
  };
}
