#!/usr/bin/env bash

[[ ! -z $1 ]] && export HOST=$1 || export HOST=$(hostname)

doas nh os test -R -H $HOST .
