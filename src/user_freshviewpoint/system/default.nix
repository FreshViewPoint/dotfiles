# HELP -> man page: configuration.nix(5) /&/ command: 'nixos-help'

{ pkgs, ... }: let inherit (import ../variables.nix) username; in {
	imports = [
		./others
		./programs
		./services
	];

	system.stateVersion = "24.05";

	nixpkgs.config.allowUnfree = true;

	nix = {
		channel.enable = false;
		settings.nix-path = "nixpkgs=flake:nixpkgs"; # -> For making nix-shell available while disabling channels.
		settings.experimental-features = [ "nix-command" "flakes" ];
	};

	environment = {
		variables = {
			TERM = "alacritty";
			TERMINAL = "alacritty";
		};

		systemPackages = with pkgs; [
			acpi
			glxinfo
			pamixer
			lm_sensors

			tree
			file
			xclip
			killall

			unzip
			unrar
  		];
	};

	# TODO: after install, set password with passwd
	users.users.${username} = {
		isNormalUser = true;
		description = "";
		extraGroups = [ "networkmanager" "wheel" "audio" ];
		createHome = true;
		shell = pkgs.fish;
	};

  	# FIREWALL OPEN/CLOSE-PORTS
  	# TO_ALLOW_TCP: networking.firewall.allowedTCPPorts = [ ... ];
  	# TO_ALLOW_UDP: networking.firewall.allowedUDPPorts = [ ... ];
  	# TO_DISABLE_FIREWALL: networking.firewall.enable = false;
}
