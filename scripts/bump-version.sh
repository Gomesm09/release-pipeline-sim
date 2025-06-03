#!/bin/bash
set -e

OLD_VERSION=$(cat VERSION)
IFS='.' read -r MAJOR MINOR PATCH <<< "$OLD_VERSION"

NEW_VERSION="$MAJOR.$MINOR.$((PATCH + 1))"
echo "$NEW_VERSION" > VERSION

git add VERSION
git commit -m "Bump version to $NEW_VERSION"
git tag -a "v$NEW_VERSION" -m "Release v$NEW_VERSION"
git push origin main --tags

echo "✅ Bumped version to $NEW_VERSION and pushed tag."