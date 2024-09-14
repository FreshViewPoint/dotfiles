# FreshViewPoint's dotfiles.

### To install:
+ Firstly, run Disko to create partitions.
+ Finally run ``sudo nixos-install --flake ./dotfiles#configurationName``.

### To rebuild-switch:
+ ```sudo nixos-rebuild switch --flake ./dotfiles#configurationName```
+ ```sudo nixos-rebuild switch --flake ./dotfiles#configurationName --no-write-lock-file```

### Notes:
+ "nix-channel" command and channels are disabled because there is no need for this.
+ To start i3wm - use ``startx ~/.xsession`` command.
+ My flake configuration is made for my computer so I can't really say this will work on another computer.

## LICENSE
These files are licensed under GNU General Public License v3, for more information, take a look at LICENSE file.
