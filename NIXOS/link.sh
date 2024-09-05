#!/usr/bin/env bash

set -e
dir=$(pwd)

ln -fs /etc/nixos/configuration.nix "${dir}/configuration.nix"
