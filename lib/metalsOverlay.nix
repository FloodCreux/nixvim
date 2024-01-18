{ ... }:

f: p:

let builder = p.callPackage ./metalsBuilder.nix { pkgs = p; };
in { metals = builder { version = "1.2.0"; }; }
