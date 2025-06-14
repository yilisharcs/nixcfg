{
  description = "yilisharcs' NixOS Config";

  inputs = {
    # Determinate Nix
    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/3";
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1"; # NixOS, rolling release
    nixpkgs-stable.url = "https://flakehub.com/f/NixOS/nixpkgs/0"; # NixOS, current stable

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # 3rd-party overlays
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
    ## FIXME: home manager complains if this is set (or something else)
    # overlays = import ./overlays { inherit inputs; };
    nixosConfigurations = {
      "S500CA" = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          ./hosts/S500CA
        ];
      };
    };
  };
}
