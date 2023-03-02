{
  description = "My Personal NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprpicker.url = "github:hyprwm/hyprpicker";
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      user = "wolly";
      system = "x86_64-linux";
      pkgs = import nixpkgs {
      };
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        wolly = lib.nixosSystem {
	  inherit system;
	  modules = [ ./configuration.nix ];
	};
      };
      hmConfig = {
        wolly = home-manager.lib.homeManagerConfiguration {
	  inherit system pkgs;
	  username = "matthias";
	  homeDirectory = "/home/matthias";
	  configuration = {
            imports = [
	      ./home.nix
	    ];
	  };
	};
      };
    };
}
