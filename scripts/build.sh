#!/bin/bash

ENV=$1

if [ -z "$ENV" ]; then
  echo "Usage: scripts/build.sh <env>"
  exit 1
fi

echo "Building app for $ENV..."
mkdir -p build
tar -czf build/app-$ENV.tar.gz app/
