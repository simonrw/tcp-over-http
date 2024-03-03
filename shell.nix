{ pkgs ? import <nixpkgs> { } }:
with pkgs;
mkShell rec {
  packages = [
    rustup
  ] ++ lib.optionals stdenv.isDarwin (with darwin.apple_sdk.frameworks; [
    libiconv
    SystemConfiguration
  ]) ++ lib.optionals stdenv.isLinux [
    mold
  ];
  # RUST_SRC_PATH = "${rustPlatform.rustLibSrc}";
  LD_LIBRARY_PATH = lib.makeLibraryPath packages;
}

