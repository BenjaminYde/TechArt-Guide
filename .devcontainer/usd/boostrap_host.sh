#!/bin/bash

SCRIPT_DIR="$(dirname "$0")"

$SCRIPT_DIR/build_docker_.openusd_2408_py310.sh
xhost +local:docker