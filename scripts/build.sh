#!/bin/bash

set -e

ENV=$1
BUILD_DIR=build

if [[ -z "$ENV" ]]; then
  echo "❌ Usage: $0 <env>"
  exit 1
fi

echo "🔨 Building artifact for environment: $ENV"

mkdir -p $BUILD_DIR

# Simulate a build by creating a tarball of the app folder
tar -czf "$BUILD_DIR/app-$ENV.tar.gz" -C app .

echo "✅ Build complete: $BUILD_DIR/app-$ENV.tar.gz"