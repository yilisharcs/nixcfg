# My Nix Config

TODO: Make a better readme.

# Getting started

TODO: It's Determinate NixOS now, not Debian.

```sh
nix run nixpkgs#git -- clone https://github.com/yilisharcs/nixcfg
sudo nixos-rebuild switch --flake .#nixos
```

I don't know why `nix flake init -t $url` doesn't work. I can't be bothered to figure out right now.

# Things that must be done but I'm not in a hurry to do

- git clone ~/.dotfiles and stow contents
- git clone Projects in ~/Projects/*
- restore neovide once multigrid is stabilized, round chars render correctly, and has native image support

# MASKFILE RULES

I love mask. It's only natural that I shove some code blocks in here to make my life easier.

## vm

> Launches a virtual machine to test the new configuration

```nu
nixos-rebuild build-vm --flake .#nixos
./result/bin/run-nixos-vm -display gtk,zoom-to-fit=on
```

# Thank you

[@nixhero](https://www.youtube.com/@nixhero): [Getting Started with Nix Home Manager](https://www.youtube.com/watch?v=cZDiqGWPHKI)
[@Sascha Koenig](https://www.youtube.com/@m3tam3re): [Rebuilding my NixOS config - Part 0: 🔧 NixOS Flakes & Git Basics: Everything You Need to Know](https://www.youtube.com/watch?v=43VvFgPsPtY&list=PLCQqUlIAw2cCuc3gRV9jIBGHeekVyBUnC&index=1)
