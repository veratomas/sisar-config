{ pkgs }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    pkg-config
  ];
  buildInputs = with pkgs; [
    openssl
    cargo
    rustc
    (rust-bin.stable.latest.default.override {
      targets = [
        "x86_64-unknown-linux-gnu"
        "x86_64-unknown-linux-musl"
      ];
    })
  ];

  shellHook = ''
    export OPENSSL_NO_VENDOR=1
    export OPENSSL_LIB_DIR="${pkgs.lib.getLib pkgs.openssl}/lib"
    export OPENSSL_DIR="${pkgs.openssl.dev}"
    export PKG_CONFIG_PATH="${pkgs.openssl.dev}/lib/pkgconfig"
    export name=rust-stable
    exec nu
  '';
}
