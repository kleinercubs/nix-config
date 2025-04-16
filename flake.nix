{
  description = "Nix Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    nixvim,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    makeHomeConfig = host:
      home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          nixvim.homeManagerModules.nixvim
          ./hosts/${host}.nix
          ./home.nix
        ];
      };
    hosts = ["cc" "goku" "vegeta"];
  in {
    homeConfigurations = nixpkgs.lib.genAttrs hosts (host: makeHomeConfig host);
    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;
  };
}
