{
  pkgs,
  ...
}:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-ocl
      intel-vaapi-driver
      mesa                  # https://nixos.wiki/wiki/OpenGL
      vpl-gpu-rt            # https://nixos.wiki/wiki/Intel_Graphics
    ];
  };
}
