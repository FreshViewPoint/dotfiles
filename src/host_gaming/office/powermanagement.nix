{ pkgs, ... }: {
	services.thermald.enable = true;

	services.tlp = {
		enable = true;
		settings = {
			DEVICES_TO_DISABLE_ON_STARTUP = "bluetooth";

			CPU_SCALING_GOVERNOR_ON_AC = "performance";
			CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

			#CPU_ENERGY_PERF_POLICY_ON_AC = "power";
			CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

			CPU_BOOST_ON_AC=1;
			CPU_BOOST_ON_BAT=0;

			TLP_DEFAULT_MODE = "BAT";
			TLP_PERSISTENT_DEFAULT = 1;
		};
	};
	
	services.logind = {
		powerKey = "suspend";
	};
}
