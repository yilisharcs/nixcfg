{
  inputs = {
    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/3";
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1"; # NixOS, rolling release
    # TODO: add overlays
    # nixpkgs-stable.url = "https://flakehub.com/f/NixOS/nixpkgs/0"; # NixOS, current stable
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };
  outputs = inputs@{
    self,
    nixpkgs,
    determinate,
    home-manager,
    neovim-nightly-overlay,
    ...
  }: {
    # NOTE: 'nixos' is the default hostname
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      modules = [
        determinate.nixosModules.default
        ./configuration.nix

        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.yilisharcs = ./home.nix;
            backupFileExtension = "backup";
            extraSpecialArgs = { inherit inputs; };
          };
        }
      ];
    };
  };
}

