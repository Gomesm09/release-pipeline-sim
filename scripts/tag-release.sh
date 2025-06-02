#!/bin/bash

set -e

VERSION=$(cat VERSION)
TAG="v$VERSION"

echo "🏷️  Tagging release as $TAG"

# Create git tag
git tag -a "$TAG" -m "Release $TAG"

# Push the tag to GitHub
git push origin "$TAG"

echo "✅ Tag $TAG pushed to GitHub"