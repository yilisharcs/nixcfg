# yilisharcs' NixOS Config

My NixOS configs and mask commands to test them. Don't expect this to be well-written; I'm enthusiastic, but I'm new at this. I knew not how to extend the template I found online and had to build my own from (mostly) scratch. This took time and headaches, but at last, it seems to be 90% in working order, pending finishing touches.

# Installation steps

Install [NixOS by Determinate Systems](https://github.com/DeterminateSystems/nixos-iso) and run the following commands:

```bash
nix run nixpkgs#git clone https://github.com/yilisharcs/nixcfg

sudo nixos-rebuild switch --flake nixcfg#S500CA
```

> [!WARNING]
>
> If you're not me, it'd be wise to create your own user and follow the steps below before running `nixos-rebuild`:

```bash
cd nixcfg/hosts
mkdir newhost && cp S500CA/default.nix newhost/default.nix
nixos-generate-config --dir newhost/
sudo nixos-rebuild switch --flake .#newhost
```

# TODO list

- [x] Configure ssh agent (VERY IMPORTANT)
- [ ] Fix neovim clipboard with xclip
- [ ] Handle potential issue with tmux clipboard on the tty
- [x] Fix theming of GTK and Qt applications
- [x] Configure virtual machines
- [x] Bring over some of my dotfiles into this repo
- [ ] Restore neovide once multigrid is stabilized, round chars render correctly, and has native image support
- [ ] Do something about home manager complaining about nix settings and overlays
- [ ] Set wallpaper
- [ ] Check out more hardware options
- [ ] Add missing icon for syncthing.desktop
- [ ] Fix focus: breaks when changing workspaces; does not move to urgent window automatically
- [ ] Create a dev-tools module
- [x] Fix: Loupe and Evince (so far) take ages to load
- [ ] Fix: Loupe has low priority despite setting mimetype correctly
- [x] Configure Evolution and make it stop crashing randomly (conjecture: might have something to do with an xdg-portal)
- [ ] Create ~/.local/bin for every user without home-manager (systemd.tmpfiles? systemd.user.tmpfiles.users?)
- [ ] Put all templates in a special folder
- [ ] Being real, this repo is garbage. I should restructure this at some point
- [ ] etc...

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

```nu
eza --tree --sort=type --color=always | less -FRX
```

# Inspiration

[@LibrePhoenix](https://www.youtube.com/@librephoenix): [How to Start Adding Modularity to your NixOS Config](https://www.youtube.com/watch?v=bV3hfalcSKs)
