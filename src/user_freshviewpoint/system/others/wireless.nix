let inherit (import ../../variables.nix) hostname; in {
	hardware.bluetooth.enable = true;
	services.blueman.enable = true;

	networking = {
		hostName = "${hostname}";
		wireless.enable = false;
		networkmanager.enable = true;

		nameservers = [
			"1.1.1.1"
			"9.9.9.9"
		];
	};
}
