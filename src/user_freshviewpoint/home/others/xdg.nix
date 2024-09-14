{
	xdg = {
		enable = true;

		userDirs = {
			enable = true;
			createDirectories = true;
		};

		mimeApps = {
			enable = true;
			defaultApplications = {
				"application/pdf" = [ "firefox.desktop" ];
				"application/x-web-browser" = [ "firefox.desktop" ];
				"x-scheme-handler/terminal" = [ "Alacritty.desktop" ];
			};
		};
	};
}
