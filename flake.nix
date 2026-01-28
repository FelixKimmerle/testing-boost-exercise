{
  description = "C++ devshell with Eigen3 + yaml-cpp + compiler";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" ];
      forAllSystems = f:
        nixpkgs.lib.genAttrs systems (system:
          f {
            pkgs = import nixpkgs { inherit system; };
          });
    in
    {
      devShells = forAllSystems ({ pkgs }: {
        default = pkgs.mkShell {
          packages = [
            # toolchain
            pkgs.clang
            pkgs.lld
            pkgs.cmake
            pkgs.ninja
            pkgs.pkg-config

            # libs
            pkgs.eigen
            pkgs.yaml-cpp
          ];

          shellHook = ''
            echo "C++ devshell: clang + cmake/ninja + Eigen (v3) + yaml-cpp"
            echo "Eigen include dir: ${pkgs.eigen}/include/eigen3"
          '';
        };
      });
    };
}
