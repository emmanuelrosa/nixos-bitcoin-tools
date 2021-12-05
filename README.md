# nixos-electrum-personal-server

A NixOS module and Nix package for Electrum Personal Server (https://github.com/chris-belcher/electrum-personal-server).

This simple Nix flake provides a simple NixOS module for running Electrum Personal Server as a user service.

## Installation (in configuration.nix) using flakes

```
inputs.electrum-personal-server.url = "github:emmanuelrosa/nixos-electrum-personal-server";
inputs.electrum-personal-server.inputs.nixpkgs.follows = "nixpkgs";
```

## Example configuration #1

This example configures an instance of EPS for each user who has an EPS configuration file at `$HOME/.config/electrum-personal-server/config.ini`.

```
services.electrum-personal-server.enable = true;
```

## Example configuration #2

This example is identical to the prior example, except that the location of the configuration file is changed.

```
services.electrum-personal-server = {
  enable = true;
  configFile = "$HOME/.eps.ini";
};
```
