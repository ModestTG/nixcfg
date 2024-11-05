#!/usr/bin/env bash

[[ ! -z $1 ]] && export HOST=$1 || export HOST=$(hostname)

nh os test -H $HOST
