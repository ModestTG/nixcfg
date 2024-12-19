#!/usr/bin/env bash

[[ ! -z $1 ]] && export HOST=$1 || export HOST=$(hostname)

nix flake update
doas nh os test -R -H $HOST .
