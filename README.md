# Get Started

First find the location that you would like to install the nix configuration, e.g., `/zp_goku/scratch_lb/weichen`. Clone this repo and place it at `/zp_goku/scratch_lb/weichen/.config`

In `nix-config/flake.nix`, configure homeConfigurations by setting
`<host> =  mkServerConfig "<username>" "<path_to_store_config>";`, where `<host>` is the one you will use to run `home-manager`.
```nix
      homeConfigurations = {
        cc = mkServerConfig "cc" "/home/cc";
        goku = mkServerConfig "weichenli" "/zp_goku/scratch_lb/weichen";
        vegeta = mkServerConfig "weichenli" "/zp_vegeta/scratch_lb/weichen";
      };
```

In `nixos/docker.nix`, `nixos/launch.nix`, `apps/ssh.nix`, change the username.

In `apps/zsh.nix`, update the conda path.

In `apps/git.nix`, config your own account.

Then, install nix environment through the following commands:
```sh
# update apt
sudo apt update && sudo apt upgrade

# install nix
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

# run home-manager
nix run nixpkgs#home-manager -- switch --flake .#<host>

# switch to zsh
sudo chsh -s $(which zsh) cc
```

## References

- [My Nix Journey - Use Nix on Ubuntu](https://tech.aufomm.com/my-nix-journey-use-nix-with-ubuntu/#Install-Nix)
- [Installing NixOS with Flakes and LVM on LUKS](https://jadarma.github.io/blog/posts/2024/08/installing-nixos-with-flakes-and-lvm-on-luks/)