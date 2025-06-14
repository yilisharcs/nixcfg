# yilisharcs' NixOS Config

My NixOS configs and mask commands to test them. Don't expect this to be well-written; I'm enthusiastic, but I'm new at this. I knew not how to extend the template I found online and had to build my own from (mostly) scratch. This took time and headaches, but at last, it seems to be 90% in working order, pending finishing touches.

# Installation steps

Install [NixOS by Determinate Systems](https://github.com/DeterminateSystems/nixos-iso) and run the following commands:

TODO: add the commands

NOTE: It'd be wise to run the following command to generate hardware-specific configuration:

```sh
sudo nixos-generate-config --show-hardware-config > /etc/nixos/hardware-configuration.nix
```

# Things that must be done but I'm not in a hurry to do

- git clone ~/.dotfiles and stow contents
- git clone Projects in ~/Projects/*
- restore neovide once multigrid is stabilized, round chars render correctly, and has native image support

# MASKFILE RULES

I love mask. It's only natural that I shove some code blocks in here to make my life easier. Did you expect otherwise? 😉

## nix

> Rebuilds the configuration

NOTE: This might fit better as a global maskfile

**OPTIONS**
* switch
  * flags: --switch
  * desc: Create a new entry in the bootloader

```nu
if $env.switch? == "true" {
	sudo nixos-rebuild switch --flake .#S500CA
} else {
	sudo nixos-rebuild test --flake .#S500CA
}
```

## vm

> Launches a virtual machine to test the new configuration

```nu
git add .
nixos-rebuild build-vm --flake .#S500CA
./result/bin/run-S500CA-vm -display sdl,gl=on # gtk,zoom-to-fit=on
```

## ls

> Shows the directory structure of the flake

You can inspect it yourself by running `nix run nixpkgs#mask ls`.

```sh
eza --tree --sort=type --color=always | less -FRX
```

# Inspiration

[@LibrePhoenix](https://www.youtube.com/@librephoenix): [How to Start Adding Modularity to your NixOS Config](https://www.youtube.com/watch?v=bV3hfalcSKs)
