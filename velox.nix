{ pkgs }:
let
  src = pkgs.fetchFromGitHub {
    owner = "facebookincubator";
    repo = "velox";
    rev = "master";
    sha256 = "sha256-Ln+o5IsiGklfYYzgqhebsGUQrfTNBT+5uOqZ2k3lA54=";
  };
in
pkgs.stdenv.mkDerivation {
  pname = "velox";
  version = "1.0";

  src = src;

  buildInputs = [
    # pkgs.cmake Example not needed as part of stdenv
  ];

  buildPhase = ''
    cd build
    make
  '';

  # installPhase = ''
  #   cd build
  #   make install
  # '';
}
