{
  description = "An Electrum Personal Server module and package for NixOS";

  outputs = { self, nixpkgs }:
  let
    name = "electrum-personal-server";
    systems = [ "x86_64-linux" "aarch64-linux" "i686-linux" "x86_64-darwin" ];

    packages = builtins.listToAttrs (nixpkgs.lib.lists.forEach systems (system: { name = system; value = { "${name}" = nixpkgs.legacyPackages.${system}.callPackage ./pkgs/electrum-personal-server.nix {}; };}));

    defaultPackage = builtins.mapAttrs (system: set: set."${name}") packages;

    apps = builtins.mapAttrs (system: set: { set."${name}" = { type = "app"; program = "${packages.${name}}/bin/electrum-personal-server"; };}) packages;
  in {
    nixosModules.electrum-personal-server = import ./modules/electrum-personal-server.nix;

    inherit packages defaultPackage apps;
  };
}
