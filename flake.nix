{
  description = "yilisharcs' NixOS Configurations";

  inputs = {
    # Determinate Nix
    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/3";
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1"; # NixOS, rolling release
    nixpkgs-stable.url = "https://flakehub.com/f/NixOS/nixpkgs/0"; # NixOS, current stable

    # Home-manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Extra overlays
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = inputs@{
    self,
    nixpkgs,
    determinate,
    home-manager,
    neovim-nightly-overlay,
    ...
  }: let inherit (self) outputs; in {                      # NOTE@1
    overlays = import ./overlays { inherit inputs; };
    # NOTE: 'nixos' is the default hostname
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs outputs; };           # HACK@1: outputs from let statement
      modules = [
        determinate.nixosModules.default
        ./hosts/nixos

        # home-manager.nixosModules.home-manager
        # {
        #   home-manager = {
        #     useGlobalPkgs = true;
        #     useUserPackages = true;
        #     users.yilisharcs = ./home.nix;
        #     backupFileExtension = "backup";
        #     extraSpecialArgs = { inherit inputs; };
        #   };
        # }
      ];
    };
    homeConfigurations = {
      "yilisharcs@nixos" = home-manager.lib.homeManagerConfiguration {
        # pkgs = nixpkgs.legacyPackages."x86_64-linux";
        extraSpecialArgs = { inherit inputs outputs; };           # HACK@1: outputs from let statement
        modules = [
          ./home/yilisharcs/nixos.nix
        ];
      };
    };
  };
}
