# Copyright (c) 2019-2020, see AUTHORS. Licensed under MIT License, see LICENSE.

{ arch ? "i686" }:

assert builtins.elem arch [ "aarch64" "i686" ];

let
  nixpkgs = import <nixpkgs> { };

  inherit (nixpkgs.lib) attrNames flatten;

  overlays = import ./overlays;

  packageNames = flatten (
    map
      (overlay: attrNames (overlay nixpkgs nixpkgs))
      overlays);

  nixpkgsWithOverlays = import <nixpkgs> {
    inherit overlays;
    system = "${arch}-linux";
  };
in

map (name: nixpkgsWithOverlays.${name}) packageNames
