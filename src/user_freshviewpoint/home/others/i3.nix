{ pkgs, config, lib, ... }: let inherit (import ../../variables.nix) username; in {
	xsession = {
		enable = true;

		profileExtra = ''
			feh --bg-scale /home/${username}/.background-image
		'';

		windowManager.i3 = { 
			enable = true;

			config = {
				fonts = { names = [ "Noto Sans" ]; style = "Regular"; size = 10.0; };

				modifier = "Mod4";
				floating.modifier = "Mod4";

				window.border = 1;
				gaps = { inner = 6; outer = 3; };

				focus.newWindow = "focus";

				startup = [
					{ command = "xfce4-clipman"; }
					{ command = "blueman-applet"; }
					{ command = "nm-applet"; }
				];

				keybindings = let modifier = config.xsession.windowManager.i3.config.modifier; in lib.mkOptionDefault {
					"${modifier}+q" = "kill";
					"${modifier}+Return" = "exec alacritty";
					"${modifier}+w" = "exec firefox";
					"${modifier}+d" = "exec rofi -show drun";
					"${modifier}+l" = "exec betterlockscreen --lock --wall";
					"Print" = "exec flameshot gui";

					"XF86AudioRaiseVolume" = "exec pamixer -i 5";
					"XF86AudioLowerVolume" = "exec pamixer -d 5";
					"XF86AudioMute" = "exec pamixer -t";
					"XF86MonBrightnessUp" = "exec brightnessctl set +5%";
					"XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
				};


				assigns = {
					"1" = [ { class = "(?i)firefox"; } ];
					#"2" = [ { class = "(?i)alacritty"; } ];
				};

				colors = {
					focused = { border = "#5294e2"; background = "#08052b"; text = "#ffffff"; indicator = "#8b8b8b"; childBorder = "#8b8b8b"; };
					focusedInactive = { border = "#08052b"; background = "#08052b"; text = "#b0b5bd"; indicator = "#000000"; childBorder = "#000000"; };
					urgent = { border = "#e53935"; background = "#e53935"; text = "#ffffff"; indicator = "#e1b700"; childBorder = "#e1b700"; };
				};

				bars = [
					{
						position = "top";
						fonts = { names = [ "Noto Sans" ]; style = "Regular"; size = 10.0; };
						trayPadding = 0;
						workspaceNumbers = true;
						statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-main.toml";

						colors = {
							background = "#383c4a";
							statusline = "#ffffff";
						};
					}
				];
			};
		};
	};

	programs.i3status-rust = {
		enable = true;
		bars = {
			main = {
				blocks = [
					{ block = "memory"; format = " $icon $mem_total_used_percents.eng(w:2) "; }

					{ block = "disk_space"; path = "/"; info_type = "available"; interval = 60; }

					{ block = "cpu"; interval = 1; }

					{ block = "temperature"; format = " $icon $max max "; interval = 10; }

					{ block = "net"; format = " $icon {S:$signal_strength - D:$speed_down - U:$speed_up}"; }

					{ block = "battery"; format = " $icon $percentage {$time |}"; interval = 10; }

					{ block = "sound"; }
				
					{ block = "backlight"; device = "intel_backlight"; }

					{ block = "time"; format = " $timestamp.datetime(f:'%a %d/%m %R') "; interval = 60; }
				];

				settings = {
					theme.theme = "semi-native";
					icons.icons = "awesome5";
				};
			};
		};
	};
}
