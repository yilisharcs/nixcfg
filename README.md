# My Nix Config

Having an escape hatch available when you're not yet comfortable with a new tool is nice. To that end, I installed Debian again, put Determinate Nix on top, and greatly simplified my config. Many things in the first version were idiosyncratic choices that didn't align with my nature, and therefore were completely unnecessary and due to a one-way trip to the trash bin. Complexity will be introduced once I can navigate it. For now, simple is good.

# Getting started

This assumes a fresh Debian install.

```sh
sudo apt update && sudo apt upgrade -y

sudo apt install curl -y

curl -fsSL https://install.determinate.systems/nix | sh -s -- install --determinate

nix run home-manager -- switch --flake github:yilisharcs/nixcfg/#yilisharcs
```

It's a good idea to follow the rest of the guide at [determinate.systems](https://docs.determinate.systems/getting-started/individuals).

# Troubleshooting

`bash: nix: command not found`? `export PATH="$PATH:/nix/var/nix/profiles/default/bin"` and try again.

# Things that must be done but I'm not in a hurry to do

- git clone ~/.dotfiles and stow contents
- git clone projects in ~/projects/*
- restore neovide once multigrid is stabilized, round chars render correctly, and has native image support

# Thank you

[@nixhero](https://www.youtube.com/@nixhero): [Getting Started with Nix Home Manager](https://www.youtube.com/watch?v=cZDiqGWPHKI)
