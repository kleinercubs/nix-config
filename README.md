# Get Started

```sh
# update apt
sudo apt update && sudo apt upgrade

# install nix
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

# run home-manager
nix run nixpkgs#home-manager -- switch --flake .#cc

# switch to zsh
sudo chsh -s $(which zsh) cc
```

## References

- [My Nix Journey - Use Nix on Ubuntu](https://tech.aufomm.com/my-nix-journey-use-nix-with-ubuntu/#Install-Nix)