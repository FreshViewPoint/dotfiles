{
	systemd.targets.hibernate = {
		enable = false;
		unitConfig.DefaultDependencies = "no";
	};
}
