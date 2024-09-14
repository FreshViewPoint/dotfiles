{ pkgs, ... }: {
	imports = [
		./others
		./programs
		./services
	];

	home.stateVersion = "24.05";

	home.file = {
		".background-image".source = ../../../util/wallpapers + "/nixos-wallpaper-catppuccin-mocha.png";
	};

	home.packages = with pkgs; [
		ani-cli
		flameshot
		jetbrains.idea-community
		xfce.xfce4-clipman-plugin

		btop
		dunst
		brightnessctl
		networkmanagerapplet
   	];
}
