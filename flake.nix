{
	description = "FreshViewPoint's dotfiles.";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

		nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager/release-24.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		nix-index-database = {
			url = "github:nix-community/nix-index-database";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		nixvim = {
			url = "github:nix-community/nixvim/nixos-24.05";
			inputs.nixpkgs.follows = "nixpkgs";
  		};
	};
	
	outputs = inputs@{ nixpkgs, nixpkgs-unstable, home-manager, nix-index-database, nixvim, ... }: let
		inherit (import ./src/user_freshviewpoint/variables.nix) username;

		unstableOverlay = [
			({ ... }: let overlay-unstable = final: prev: {
				unstable = import nixpkgs-unstable {
					system = final.system;
					config.allowUnfree = true;
				};
			}; in {
				nixpkgs.overlays = [ overlay-unstable ];
			})
		];

		x86_64 = [
			./src/user_${username}/system

			nix-index-database.nixosModules.nix-index {
				programs.nix-index-database.comma.enable = true;
			}

			home-manager.nixosModules.home-manager {
				home-manager = {
					useGlobalPkgs = true;
					useUserPackages = true;
					sharedModules = [ nixvim.homeManagerModules.nixvim ];
					users.${username} = import ./src/user_${username}/home;
				};
			}
		] ++ unstableOverlay;
	in {
		nixosConfigurations = {
			gaming-office = nixpkgs.lib.nixosSystem { system = "x86_64-linux"; modules = x86_64 ++ [ ./src/host_gaming/office ]; };
			gaming-gaming = nixpkgs.lib.nixosSystem { system = "x86_64-linux"; modules = x86_64 ++ [ ./src/host_gaming/gaming ]; };
		};
	};
}
