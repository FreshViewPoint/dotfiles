# sudo echo -n "YOURPASSWORD" > /tmp/secret.key
# sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko ./disk-scheme.nix
{
	disko.devices = {
		disk.nvme = {
			type = "disk";
			device = "/dev/nvme0n1";
			content = {
				type = "gpt";
				partitions = {
					ESP = {
						size = "500M";
						type = "EF00";
						content = {
							type = "filesystem";
							format = "vfat";
							mountpoint = "/boot";
						};
					};

					luks = {
						size = "100%";
						content = {
							type = "luks";
							name = "crypted";
							settings.allowDiscards = true;
							passwordFile = "/tmp/secret.key";
							content = {
								type = "filesystem";
								format = "ext4";
								mountpoint = "/";
							};
						};
					};
				};
			};
		};
	};
}
