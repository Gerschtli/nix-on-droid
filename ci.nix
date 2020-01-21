# Copyright (c) 2019-2020, see AUTHORS. Licensed under MIT License, see LICENSE.

let
  nixpkgs = import <nixpkgs> { };

  inherit (nixpkgs.lib) genAttrs;

  pkgs = import ./pkgs;
in

genAttrs
  [ "aarch64" "i686" ]
  (arch: (pkgs { inherit arch; }) // { recurseForDerivations = true; })
