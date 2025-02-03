final: prev: {
  operator-mono-nerd-font = prev.callPackage ./operator-mono-nerd-font {
    inherit (prev) fetchzip stdenv;
  };

  base16-schemes = prev.base16-schemes.overrideAttrs {
    version = "spec-0.11";
    src = prev.fetchFromGitHub {
      owner = "tinted-theming";
      repo = "schemes";
      rev = "refs/heads/spec-0.11";
      hash = "sha256-y+9cvOA6BLKT0WfebDsyUpUa/YxKow9hTjBp6HpQv68=";
    };
  };
}
