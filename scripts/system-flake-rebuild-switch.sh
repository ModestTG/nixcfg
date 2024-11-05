#!/usr/bin/env bash

[[ ! -z $1 ]] && export HOST=$1 || export HOST=$(hostname)

nh os switch -H $HOST
