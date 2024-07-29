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
}
