{
	inputs = {
		utils.url = "github:numtide/flake-utils";

		fenix = {
			url = "github:nix-community/fenix";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, fenix, nixpkgs, utils }: utils.lib.eachDefaultSystem (system: let
			pkgs = import nixpkgs {
				inherit system;
				overlays = [ fenix.overlays.default ];
			};

			toolChainFromFile = fenix.packages.${system}.fromToolchainFile {
				file = ./rust-toolchain;
				sha256 = pkgs.lib.fakeSha256; # Fill here with error output sha. 
			};

			rustToolchain = with fenix.packages.${system}; combine [
				toolChainFromFile
				complete.rust-src
				complete.rust-analyzer
				# ... - https://github.com/nix-community/fenix/tree/main/data
			];
		in {
			devShells.default = pkgs.mkShell {
				name = "*** CHANGE HERE ***";

				nativeBuildInputs = [
					rustToolchain
				];

				shellHook = ''
					echo 
					echo "|‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾|"
					echo "|        FILL-HERE       |"
					echo "|________________________|"
					echo
				'';
			};
		}
	);
}
