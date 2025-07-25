{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    vscode-server.url = "github:nix-community/nixos-vscode-server";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs @ {
    self,
    nixpkgs,
    flake-utils,
    vscode-server,
    home-manager,
    nixvim,
    darwin,
    disko,
    ...
  }: let
    # Common functions
    mkNixosConfig = username:
      nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./nixos
          disko.nixosModules.disko
          vscode-server.nixosModules.default
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${username}.imports = [
              nixvim.homeManagerModules.nixvim
              ./home-manager/nixos.nix
            ];
          }
        ];
      };

    mkDarwinConfig = username:
      darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          {
            users.users.${username} = {
              name = username;
              home = "/Users/${username}";
            };
            nix.settings.trusted-users = [
              "root"
              "@admin"
              username
            ];
            system.primaryUser = username;
            system.stateVersion = 6;
            system.configurationRevision = self.rev or self.dirtyRev or null;
          }
          ./darwin
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${username}.imports = [
              nixvim.homeManagerModules.nixvim
              ./home-manager/darwin.nix
            ];
          }
        ];
      };

    mkServerConfig = username: homeDir:
      home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {system = "x86_64-linux";};
        modules = [
          nixvim.homeManagerModules.nixvim
          ./home-manager/server.nix
        ];
        extraSpecialArgs = {
          inherit username homeDir;
        };
      };
  in
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};
      in {
        formatter = pkgs.alejandra;
      }
    )
    // {
      nixosConfigurations = {
        steamer = mkNixosConfig "weichenli";
      };

      darwinConfigurations = {
        mac = mkDarwinConfig "weichenli";
      };

      homeConfigurations = {
        cc = mkServerConfig "cc" "/home/cc";
        goku = mkServerConfig "weichenli" "/zp_goku/scratch_lb/weichen";
        vegeta = mkServerConfig "weichenli" "/zp_vegeta/scratch_lb/weichen";
      };
    };
}
