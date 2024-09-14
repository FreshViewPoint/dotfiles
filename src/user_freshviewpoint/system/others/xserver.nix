{ pkgs, ... }: {
	services.xserver = {
		enable = true;
		excludePackages = with pkgs; [ xterm ];

		displayManager = {
			startx.enable = true;
		};
	};
}
