# nixos-bitcoin-tools

NixOS modules and Nix packages for bitcoin-related tools.

## NixOS installation (in flake.nix)

```
{
    inputs.bitcoin-tools.url = "github:emmanuelrosa/nixos-bitcoin-tools";
    inputs.bitcoin-tools.inputs.nixpkgs.follows = "nixpkgs";
    
    outputs = { self, nixpkgs, bitcoin-tools }: {
        nixosConfigurations.whatever = nixpkgs.lib.nixosSystem {
            ...
            modules = [
                bitcoin-tools.nixosModules.electrum-personal-server
            ];
        };
    };
}        
```

## Modules

### electrum-personal-server

A simple NixOS module for running Electrum Personal Server (https://github.com/chris-belcher/electrum-personal-server) as a user service.

#### Example configuration #1

This example configures an instance of EPS for each user who has an EPS configuration file at `$HOME/.config/electrum-personal-server/config.ini`.

```
services.electrum-personal-server.enable = true;
```

#### Example configuration #2

This example is identical to the prior example, except that the location of the configuration file is changed.

```
services.electrum-personal-server = {
  enable = true;
  configFile = "$HOME/.eps.ini";
};
```
