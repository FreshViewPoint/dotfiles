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
		(xfce.thunar.override {
			thunarPlugins = [
				xfce.thunar-volman
				xfce.thunar-archive-plugin
				xfce.thunar-media-tags-plugin
			];
		})

		ani-cli
		obsidian
		flameshot
		xfce.xfce4-clipman-plugin

		btop
		dunst
		brightnessctl
		networkmanagerapplet
   	];
}
