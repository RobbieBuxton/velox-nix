self: super: {
  xsimd = super.xsimd.overrideAttrs (finalAttrs: {
    version = "10.0.0";
    src = super.fetchFromGitHub {
      owner = "xtensor-stack";
      repo = "xsimd";
      rev = "10.0.0";
      hash = "sha256-+ewKbce+rjNWQ0nQzm6O4xSwgzizSPpDPidkQYuoSTU=";
    };
    patches = [];
  });

  folly = super.folly.overrideAttrs (finalAttrs: {
    version = "2024.05.20.00";
     src = super.fetchFromGitHub {
      owner = "facebook";
      repo = "folly";
      rev = "v2024.05.20.00";
      sha256 = "sha256-PX9gNAfDUm3wZPRoANDrksiy0bJAmRc5gEEcCtuJUwY=";
    };
    patches = [
      # (super.fetchpatch {
      #   url = "https://raw.githubusercontent.com/facebookincubator/velox/main/CMake/resolve_dependency_modules/folly/folly-gflags-glog.patch";
      #   hash = "sha256-ztiM+97vzJ1bcBR0nk/HIfVxOwIXE6noQ+Ylrqjakz0=";
      # })
      # (super.fetchpatch {
      #   url = "https://raw.githubusercontent.com/facebookincubator/velox/main/CMake/resolve_dependency_modules/folly/folly-no-export.patch";
      #   hash = "sha256-VSboK8SSLgCRgOIdW3OhyZP4IPQkEU02iYUfBpu523E=";
      # })
    ];
  });

  # glog = super.glog.overrideAttrs (finalAttrs: {
  #   patches = [
  #     # (super.fetchpatch {
  #     #   url = "https://raw.githubusercontent.com/facebookincubator/velox/main/CMake/resolve_dependency_modules/glog/glog-config.patch";
  #     #   hash = "sha256-RrPJtBGpfEgSvY4I6tuIExpa8nm6qJCOoBZuiK1yGtY=";
  #     # })
  #     # (super.fetchpatch {
  #     #   url = "https://raw.githubusercontent.com/facebookincubator/velox/main/CMake/resolve_dependency_modules/glog/glog-no-export.patch";
  #     #   hash = "sha256-Xd9lJK794emCxc81mmXLvFSObZkHENImz3uR+eu+yWQ=";
  #     # })
  #   ];
  #   # Tests fail for 'cmake_package_config_generate'
  #   doCheck = false;
  # });

  re2 = super.callPackage ./re2_2022_02_01_overlay.nix {};
}
