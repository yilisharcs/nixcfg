{
  imports = [
    ./configuration.nix
    ../../modules/system/core

    ../../modules/system/optional/audio
    ../../modules/system/optional/drivers/gpu/intel.nix
    ../../modules/system/optional/drivers/printer
    ../../modules/system/optional/environments/cosmic.nix
    ../../modules/system/optional/pkgs/desktop
    ../../modules/system/optional/pkgs/terminal
    ../../modules/system/optional/virtualization

    # Declare users here
    ../../modules/users/yilisharcs
    ../../modules/users/designer
  ];
}
