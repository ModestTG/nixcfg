#!/usr/bin/env bash

[[ ! -z $1 ]] && export HOST=$1 || export HOST=$(hostname)

doas nixos-rebuild switch --flake .#$HOST