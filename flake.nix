{
  description = "coreboot configuration";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/release-25.05";

  outputs =
    { self, nixpkgs }:
    {
      devShells."x86_64-linux".default =
        let
          pkgs = import nixpkgs { system = "x86_64-linux"; };
        in
        pkgs.mkShellNoCC {
          buildInputs = with pkgs; [
            gnat
            ncurses
            m4
            flex
            bison
            zlib
            pkg-config
            openssl
            libuuid
            nasm
            imagemagick

            qemu
            flashrom

            cbfstool
            ifdtool
          ];

          shellHook = ''
            # TODO remove?
            NIX_LDFLAGS="$NIX_LDFLAGS -lncurses"
          '';
        };
    };
}
