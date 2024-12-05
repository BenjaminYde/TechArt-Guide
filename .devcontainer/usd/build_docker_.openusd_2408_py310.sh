#!/bin/bash

# create variables
BUILD_CONTEXT="$(dirname "$0")"
IMAGE_NAME=nvidia_openusd-2408-py310
PATH_DOCKERFILE=$BUILD_CONTEXT/Dockerfile.openusd_2408_py310

# docker build
echo -e "Building nvidia openusd dockerfile...\n"

docker build \
    --rm \
    --file $PATH_DOCKERFILE \
    -t $IMAGE_NAME \
    $BUILD_CONTEXT

echo -e "Done building nvidia openusd dockerfile!\n"