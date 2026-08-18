## NixOS Submodules
This directory contains modular NixOS configurations organized by functionality.

## Current Structure

```
modules/
├── boot.nix # basic boot settings
├── desktop.nix # desktop environment configuration
├── fonts.nix # font configuration
├── gaming.nix # gaming applications and tweaks
├── howdy.nix # howdy configuration, used only by absurd-nixos host
├── i18n.nix # internationalization
├── networking.nix # networking configuration
├── nix.nix # nix package manager / nixos specific settings
├── packages.nix # system packages
├── peripherals.nix # configuration of peripherals
├── power.nix # power related settings
├── security.nix # security relalted settings
├── ssh.nix # basic ssh configuration
├── tty.nix # tty settings
└── users.nix # user managment
```
