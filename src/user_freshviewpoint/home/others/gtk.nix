{ pkgs, ... }: {
	gtk = {
		enable = true;

		theme.package = (pkgs.qogir-theme.override {
			themeVariants = [ "default" ];
			colorVariants = [ "dark" ];
		});
		iconTheme.package = (pkgs.qogir-icon-theme.override {
			colorVariants = [ "standard" ];
			themeVariants = [ "default" ];
		});

		theme.name = "Qogir-Dark";
		iconTheme.name = "Qogir";
		cursorTheme.name = "Qogir";
	};
}
