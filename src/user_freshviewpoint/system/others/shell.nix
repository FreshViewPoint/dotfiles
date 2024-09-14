{
	programs.fish = {
		enable = true;
		interactiveShellInit = ''set fish_greeting'';
	};

	programs.starship = {
		enable = true;
		settings = {
			character = {
				disabled = false;
				format = "  $symbol: ";
				success_symbol = "[λ](bold green) ";
				error_symbol = "[λ](bold red) ";
			};

			time = {
				disabled = false;
				format = "🕙 $time($style) ";
				style = "bright-white";
			};
		};
	};
}
