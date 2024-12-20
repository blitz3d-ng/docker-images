#!/bin/sh

set -e

IMAGE=ghcr.io/blitz3d-ng/env
PLATFORMS=${1:-"debian-10 debian-11 debian-12 ubuntu-20.04 ubuntu-22.04 ubuntu-24.04 archlinux android nx mingw emscripten"}
VERSION=v20241218

echo "Building $PLATFORMS..."

for platform in $PLATFORMS
do
  docker build --platform=linux/x86_64 -t $IMAGE:$platform-$VERSION -f Dockerfile.$platform .
done
