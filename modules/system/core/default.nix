{
  imports = [
    ./bootloader
    ./kernel
    ./keyboard
    ./locale
    ./nixconf
  ];

  environment.localBinInPath = true;
}
