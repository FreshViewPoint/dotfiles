{ config, lib, modulesPath, ... }: {
	imports = [
		(modulesPath + "/installer/scan/not-detected.nix")
	];

	networking.useDHCP = lib.mkDefault true;
  	nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  	hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

	boot = {
		kernelModules = [ "kvm-intel" ];

		initrd = {
			luks.devices."crypted".device = "/dev/disk/by-partlabel/disk-nvme-luks";
			availableKernelModules = [ "vmd" "xhci_pci" "ahci" "nvme" "usb_storage" "sd_mod" ];
		};
	};
  	
  	fileSystems = {
		"/" = {
			device = "/dev/mapper/crypted";
			fsType = "ext4";
		};

  		"/boot" = {
			device = "/dev/disk/by-partlabel/disk-nvme-ESP";
			fsType = "vfat";
			options = [ "fmask=0022" "dmask=0022" ];
		};
	};
}
