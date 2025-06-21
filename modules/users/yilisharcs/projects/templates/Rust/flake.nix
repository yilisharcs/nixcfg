# flake.nix - Nix Flake configuration file
# This file defines a reproducible development environment using Nix flakes
# Documentation: https://nixos.wiki/wiki/Flakes
{
  description = "GENIT_PROJECT_NAME";

  # Inputs are external dependencies for our flake
  inputs = {
    # nixpkgs is the main package repository for Nix
    # Using "nixos-unstable" gives us the latest packages
    # See available packages at: https://search.nixos.org/packages
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # flake-utils helps us write flakes that work on multiple systems (Linux, macOS)
    # Documentation: https://github.com/numtide/flake-utils
    flake-utils.url = "github:numtide/flake-utils";
  };
  # Outputs define what our flake produces
  outputs = { self, nixpkgs, flake-utils }:
    # This function creates outputs for each system (x86_64-linux, aarch64-darwin, etc.)
    flake-utils.lib.eachDefaultSystem (system:
      let
        # Import nixpkgs for our specific system
        pkgs = nixpkgs.legacyPackages.${system};
        overrides = (builtins.fromTOML (builtins.readFile (self + "/rust-toolchain.toml")));
      in
        {
        # devShells.default is the development environment
        # It's activated with 'nix develop' or automatically via direnv
        # Documentation: https://nixos.wiki/wiki/Development_environment_with_nix-shell
        devShells.default = pkgs.mkShell rec {
          # Dependencies that should only exist in the build environment
          nativeBuildInputs = with pkgs; [
            # pkg-config
            mold                           # extremely fast linker

            # Rust toolchain
            rustup
            cargo-auditable
          ];

          # Dependencies that should exist in the runtime environment
          buildInputs = with pkgs; [
            # udev
          ];

          # Packages to include in the shell environment
          packages = with pkgs; [
            # Dev tools
            entr                           # file watcher
            git                            # version control system
            jujutsu
            mask                           # markdown task runner
            nushell
            pandoc                         # markup converter
            rusty-man                      # man pages for rustdoc
            sccache                        # cache tool for build artifacts

            # Cargo add-ons
            cargo-audit
            cargo-modules
            cargo-nextest
            cargo-sweep
          ];

          # Shell hook runs when entering the shell
          # Use this for environment setup, variables, and welcome messages
          shellHook = ''
            # echo "Loaded development environment at $(pwd)"
          '';

          # Environment variables
          # These are set when the shell is active
          PROJECT_NAME = "GENIT_PROJECT_PATH";
          RUSTC_VERSION = overrides.toolchain.channel;
          RUST_BACKTRACE = 1;
          LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath buildInputs;
        };
      });
}
