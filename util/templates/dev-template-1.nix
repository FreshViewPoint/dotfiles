{ pkgs ? import <nixpkgs> {} }: pkgs.mkShell {
	name = "*** CHANGE HERE ***";

	nativeBuildInputs = [];

	buildInputs = [];

	packages = [];

	shellHook = ''
		echo "Start developing..."
	'';
}
