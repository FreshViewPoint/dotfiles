{ pkgs, ... }: {
	fonts.packages = with pkgs; [
		noto-fonts
		font-awesome
		(nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
	];
}
