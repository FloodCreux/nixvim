{ pkgs, ... }:

{
  metalsBuilder = import ./metalsBuilder.nix { inherit pkgs; };
  metalsOverlay = import ./metalsOverlay.nix { };
}
