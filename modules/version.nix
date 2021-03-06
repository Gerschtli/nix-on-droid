# Copyright (c) 2019-2020, see AUTHORS. Licensed under MIT License, see LICENSE.

{ config, lib, pkgs, ... }:

with lib;

{

  ###### interface

  options = {

    system.stateVersion = mkOption {
      type = types.enum [ "19.09" "20.03" ];
      default = "19.09";
      description = ''
        It is occasionally necessary for nix-on-droid to change
        configuration defaults in a way that is incompatible with
        stateful data. This could, for example, include switching the
        default data format or location of a file.
        </para><para>
        The <emphasis>state version</emphasis> indicates which default
        settings are in effect and will therefore help avoid breaking
        program configurations. Switching to a higher state version
        typically requires performing some manual steps, such as data
        conversion or moving files.
      '';
    };

  };

}
