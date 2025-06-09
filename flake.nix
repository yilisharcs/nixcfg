{
  description = ''
    yilisharcs' NixOS Configurations

    Template: https://www.youtube.com/watch?v=OFGyKMSJzXY&list=PLCQqUlIAw2cCuc3gRV9jIBGHeekVyBUnC&index=3
  '';

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
  }: let inherit (self) outputs; in {
    overlays = import ./overlays { inherit inputs; };
    # NOTE: 'nixos' is the default hostname
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs outputs; };
      modules = [
        determinate.nixosModules.default
        ./hosts/nixos
      ];
    };
    homeConfigurations = {
      "yilisharcs@nixos" = home-manager.lib.homeManagerConfiguration {
        # NOTE: This might be a point of failure
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        extraSpecialArgs = { inherit inputs outputs; };
        modules = [
          ./home/yilisharcs/nixos.nix
        ];
      };
    };
  };
}
