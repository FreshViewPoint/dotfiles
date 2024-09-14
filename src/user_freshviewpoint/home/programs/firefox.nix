let
	lock-false = { Value = false; Status = "locked"; };
	lock-true = { Value = true; Status = "locked"; };
	inherit (import ../../variables.nix) username;
in {
	programs.firefox = {
		enable = true;

		profiles.${username}.bookmarks = [
			{ name = "Wikipedia"; tags = [ "wiki" ]; keyword = "wiki"; url = "https://en.wikipedia.org/"; }
			{ name = "YouTube"; tags = [ "youtube" "yt" "video" ]; keyword = "yt"; url = "https://www.youtube.com/"; }
			{ name = "Translate"; tags = [ "translate" ]; keyword = "translate"; url = "https://translate.google.com/"; }
			{ name = "Proton Mail"; tags = [ "proton" "pmme" ]; keyword = "pmme"; url = "https://mail.proton.me/"; }
			{ name = "Libera IRC client"; tags = [ "libera" "irc" ]; keyword = "irc"; url = "https://web.libera.chat/"; }

  			{
				name = "Development";
				bookmarks = [
					{ name = "cppreference.com"; tags = [ "cpp" ]; url = "https://cppreference.com/"; }
					{ name = "OSDev.org Wiki"; tags = [ "wiki" "osdev" ]; url = "https://wiki.osdev.org/"; }
					{ name = "OSDev.org Forum"; tags = [ "forum" "osdev" ]; url = "https://forum.osdev.org/"; }

					{ name = "GitHub"; tags = [ "git" "github" ]; url = "https://github.com/"; }
					{ name = "GitLab"; tags = [ "git" "gitlab" ]; url = "https://gitlab.com/"; }
					{ name = "Git and SSH usage."; tags = [ "ssh" "git" ]; url = "https://gist.github.com/xirixiz/b6b0c6f4917ce17a90e00f9b60566278"; }
				];
  			}

			{
				name = "NixOS";
				bookmarks = [
					{ name = "search"; tags = [ "search" "nix" ]; url = "https://search.nixos.org/"; }
					{ name = "wiki"; tags = [ "wiki" "nix" ]; url = "https://wiki.nixos.org/"; }
					{ name = "discourse"; tags = [ "forum" "nix" ]; url = "https://discourse.nixos.org/"; }
					{ name = "home manager options"; tags = [ "search" "hm" "nix" ]; url = "https://home-manager-options.extranix.com/"; }
				];
			}
		];

		# about:policies#documentation
		policies = {
			DisableTelemetry = true;
			DisableFirefoxStudies = true;
			EnableTrackingProtection = {
				Value = true;
				Locked = true;
				Cryptomining = true;
				Fingerprinting = true;
			};

			DisablePocket = true;
			DisableAccounts = true;
			DisableFirefoxAccounts = true;
			DisableFirefoxScreenshots = true;

			DontCheckDefaultBrowser = true;
			DisplayBookmarksToolbar = "never";

			SearchBar = "unified";
			DisplayMenuBar = "default-off";

			OverrideFirstRunPage = "";
			OverridePostUpdatePage = "";

			ExtensionSettings = {
				"*".installation_mode = "blocked"; # blocks all addons except the ones specified below

				"uBlock0@raymondhill.net" = {
					install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
					installation_mode = "force_installed";
				};
			};

			Preferences = {
				"browser.startup.page" = 3;
				"browser.sessionstore.restore_on_startup" = lock-true;

				"extensions.pocket.enabled" = lock-false;
				"extensions.screenshots.disabled" = lock-true;

				"browser.formfill.enable" = lock-false;
				"browser.topsites.contile.enabled" = lock-false;

				"browser.search.suggest.enabled.private" = lock-false;
				"browser.urlbar.showSearchSuggestionsFirst" = lock-false;

				"browser.newtabpage.activity-stream.showSponsored" = lock-false;
				"browser.newtabpage.activity-stream.feeds.snippets" = lock-false;
				"browser.newtabpage.activity-stream.feeds.topsites" = lock-false;
				"browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
				"browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;
				"browser.newtabpage.activity-stream.feeds.section.topstories" = lock-false;
				"browser.newtabpage.activity-stream.section.highlights.includePocket" = lock-false;
				"browser.newtabpage.activity-stream.section.highlights.includeVisited" = lock-false;
				"browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = lock-false;
				"browser.newtabpage.activity-stream.section.highlights.includeDownloads" = lock-false;

				"network.trr.mode" = 2;
				"privacy.donottrackheader.enabled" = true;
				"privacy.globalprivacycontrol.enabled" = true;
				"browser.contentblocking.category" = { Value = "strict"; Status = "locked"; };
			};
		};
	};
}
