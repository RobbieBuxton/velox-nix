{
  description = "Velox a C++ database acceleration library";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { 
        inherit system;
        overlays = [ (import ./overlays.nix) ];
      };
      velox = pkgs.callPackage ./velox.nix {};
    in
    {
      packages.${system} = {
        default = velox;
        velox = velox;
      };
      devShells.${system}.default = pkgs.mkShell {
        packages = [ velox ];
      };
    };
}
