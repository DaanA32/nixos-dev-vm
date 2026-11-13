#!/bin/bash
export NIXPKGS_ALLOW_UNFREE=1
nix-build --impure '<nixpkgs/nixos>' -A vm -I nixpkgs=channel:nixos-24.05 -I ./pkgs/ -I nixos-config=./configuration.nix
