let
	hostPkgs = import <nixpkgs> {};
	pkgs = hostPkgs.pkgsCross.-CHANGE-HERE-; # https://nix.dev/tutorials/cross-compilation.html#choosing-the-host-platform-with-nix
in pkgs.mkShell {
	name = "-Personalize Here-";

	nativeBuildInputs = with pkgs.buildPackages; []; ## for build tools.

	buildInputs = with pkgs; []; 					 ## for libraries

	packages = with hostPkgs; [];					 ## for others

	shellHook = ''
		echo "You're ready."
	'';
}
