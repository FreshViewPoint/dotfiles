let
	hostPkgs = import <nixpkgs> {};
	pkgs = hostPkgs.pkgsCross.-CHANGE-HERE-; # https://nix.dev/tutorials/cross-compilation.html#choosing-the-host-platform-with-nix
in pkgs.mkShell {
	name = "-Personalize Here-";

	## for build tools.
	nativeBuildInputs = with pkgs.buildPackages; [];

	## for libraries
	buildInputs = with pkgs; [];

	## for others
	packages = with hostPkgs; [];

	shellHook = ''
		echo "You're ready."
	'';
}
