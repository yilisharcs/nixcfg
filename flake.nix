{
  description = "Home Manager configuration of yilisharcs";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Extra source for graphics compatibility.
    nixgl.url = "github:nix-community/nixGL";
  };

  outputs =
    {
      nixgl,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations."yilisharcs" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
        extraSpecialArgs = {
          inherit inputs;
          nixgl = nixgl;
        };

        # TODO: make sure this works
        # backupFileExtension = "backup";

        # # Shush nix complaints about uncommitted changes
        # nix.settings.warn-dirty = false;
      };
    };
}
