{
  lib,
  inputs,
  outputs,
  ...
}:

{
  imports = [
    inputs.determinate.nixosModules.default
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit inputs outputs; };
  };

  nixpkgs = {
    ## FIXME: remove this?
    # overlays = [
    #   # Add overlays your own flake exports (from overlays and pkgs dir):
    #   outputs.overlays.additions
    #   outputs.overlays.modifications
    #   outputs.overlays.stable-packages
    #
    #   # You can also add overlays exported from other flakes:
    #   # neovim-nightly-overlay.overlays.default
    #
    #   # Or define it inline, for example:
    #   # (final: prev: {
    #   #   hi = final.hello.overrideAttrs (oldAttrs: {
    #   #     patches = [ ./change-hello-to-hi.patch ];
    #   #   });
    #   # })
    # ];

    # Configure your nixpkgs instance
    config = {
      allowUnfree = lib.mkDefault false;
    };
  };

  nix = {
    # settings = {
    #   trusted-users = [
    #     "root"
    #     # "yilisharcs"
    #   ]; # Set users that are allowed to use the flake command
    # };
  };
}
