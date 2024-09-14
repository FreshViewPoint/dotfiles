{ pkgs, ... }: {
	programs.java = {
		enable = true;
		package = pkgs.temurin-bin;
	};
}
