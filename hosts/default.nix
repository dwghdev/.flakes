  { system, self, nixpkgs, inputs, user, ... };

let 
  pkgs = import nixpkgs {
    inherit systeml
    config.allowUnfree = true;
  };

  lib nixpkgs.lib;
in 
{
  laptop = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs user; };
    modules = []
  };
}
