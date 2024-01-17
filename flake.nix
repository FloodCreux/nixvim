{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs = { url = "github:nixos/nixpkgs/nixos-unstable"; };
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = { neovim-nightly-overlay, nixvim, flake-parts, ... }@inputs:
    let
      config = import ./config;
      # overlays = [ neovim-nightly-overlay ];
    in flake-parts.lib.mkFlake { inherit inputs; } {
      systems =
        [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];

      perSystem = { system, ... }:
        let

          lib = import ./lib { inherit pkgs; };
          inherit (lib) metalsBuilder metalsOverlay;

          neovimOverlay = f: p: {
            neovim-nightly = inputs.neovim-nightly-overlay.overlay;
          };

          pkgs = import inputs.nixpkgs {
            inherit system;
            config = { allowUnfree = true; };
            overlays = [ neovimOverlay metalsOverlay ];
          };

          nixvimLib = nixvim.lib.${system};
          nixvim' = nixvim.legacyPackages.${system};
          nvim = nixvim'.makeNixvimWithModule {
            inherit pkgs;
            module = config;
            # You can use `extraSpecialArgs` to pass additional arguments to your module files
            extraSpecialArgs = {
              # inherit (inputs) foo;
            };
          };
        in {
          _module.args.pkgs = import inputs.nixpkgs {
            inherit system;

            overlays.default = f: p: { inherit metalsBuilder; };
          };

          checks = {
            # Run `nix flake check .` to verify that your config is not broken
            default = nixvimLib.check.mkTestDerivationFromNvim {
              inherit nvim;
              name = "A nixvim configuration";
            };
          };

          packages = {
            # Lets you run `nix run .` to start nixvim
            default = nvim;
          };
        };
    };
}
