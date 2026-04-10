#!/bin/bash

set -e

# Usage: ./scripts/rollback.sh v1.2.2
TARGET_TAG=$1

if [ -z "$TARGET_TAG" ]; then
  echo "❌ No tag specified. Usage: ./scripts/rollback.sh <tag>"
  exit 1
fi

echo "⏪ Rolling back to $TARGET_TAG..."

# Check if tag exists
if ! git rev-parse "$TARGET_TAG" >/dev/null 2>&1; then
  echo "❌ Tag $TARGET_TAG does not exist."
  exit 1
fi

# Checkout the target tag
git checkout "$TARGET_TAG"

echo "✅ Successfully rolled back to $TARGET_TAG"
echo "🔍 Current version: $(cat VERSION)"