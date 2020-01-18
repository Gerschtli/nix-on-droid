# Copyright (c) 2019-2020, see AUTHORS. Licensed under MIT License, see LICENSE.

let
  nixpkgs = import <nixpkgs> { };

  inherit (nixpkgs.lib) attrNames flatten genAttrs;

  overlays = import ./overlays;
  pkgs = import ./pkgs;

  packageNames = flatten (
    map
      (overlay: attrNames (overlay nixpkgs nixpkgs))
      overlays);

  nixpkgsWithOverlays = import <nixpkgs> { inherit overlays; };
in

{
  overlays = map (name: nixpkgsWithOverlays.${name}) packageNames;

  pkgs = genAttrs
    [ "aarch64" "i686" ]
    (arch: (pkgs { inherit arch; }) // { recurseForDerivations = true; });
}
