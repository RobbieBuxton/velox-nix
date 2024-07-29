{ pkgs }:
let
  src = pkgs.fetchFromGitHub {
    owner = "OliverKillane";
    repo = "velox";
    rev = "stemmer_non_bundled";
    sha256 = "sha256-XtKeQutJ1x8XdrSsG8iAFP3ewGKA8KfRN9Z5314iqh4=";
  };
in
pkgs.stdenv.mkDerivation {
  pname = "velox";
  version = "1.0";

  src = src;

  dontUseCmakeConfigure=true;

  nativeBuildInputs = [
    pkgs.cmake 
  ];

  buildInputs = with pkgs; [
    boost
    gflags
    glog
    openssl_3_3
    fmt
    pkg-config
    re2
    simdjson
    folly
    bison
    flex
    double-conversion
    xsimd
    libstemmer
  ];

  buildPhase = ''
    export VELOX_DEPENDENCY_SOURCE=SYSTEM
    make minimal
  '';

  # installPhase = ''
  #   cd build
  #   make install
  # '';
}
