{ pkgs, ... }: {
	services.thermald.enable = true;

	services.tlp = {
		enable = true;
		settings = {
			DEVICES_TO_DISABLE_ON_STARTUP = "bluetooth";

			CPU_SCALING_GOVERNOR_ON_AC = "performance";
			CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
			CPU_BOOST_ON_AC=1;
		};
	};
	
	services.logind = {
		powerKey = "suspend";
	};
}
