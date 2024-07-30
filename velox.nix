{ pkgs }:
let
  src = pkgs.fetchFromGitHub {
    owner = "OliverKillane";
    repo = "velox";
    rev = "stemmer_non_bundled";
    sha256 = "sha256-neVbycp9Ixswj+GkruEq2q2TluZWFUQDgzOG/2W+aIo=";
  };
in
pkgs.stdenv.mkDerivation {
  pname = "velox";
  version = "1.0";

  src = src;

  dontUseCmakeConfigure=true;

  nativeBuildInputs = [
    pkgs.cmake 
    pkgs.gcc12
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
    NUM_THREADS=8 make minimal
  '';

  installPhase = ''
    mkdir $out
    cp -r _build/release $out
  '';
}
