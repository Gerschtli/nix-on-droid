# Copyright (c) 2019-2020, see AUTHORS. Licensed under MIT License, see LICENSE.

{ super }:

let
  pinnedPkgsSrc = super.fetchFromGitHub {
    owner = "NixOS";
    repo = "nixpkgs";
    rev = "c438ce12a858f24c1a2479213eaab751da45fa50";
    sha256 = "18m4hxx8y0gfrmhkz29iyc0hmss584m9xhgpk7j7bwjaci0fps4z";
  };
in

import pinnedPkgsSrc {
  inherit (super) config;
  overlays = [ ];
}
