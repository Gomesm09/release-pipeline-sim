##!/bin/bash

# Usage: ./scripts/promote.sh dev stage
set -e

FROM_ENV=$1
TO_ENV=$2

FROM_FILE="config/${FROM_ENV}.json"
TO_FILE="config/${TO_ENV}.json"

if [ ! -f "$FROM_FILE" ]; then
  echo "❌ Source file does not exist: $FROM_FILE"
  exit 1
fi

# Copy and modify the config file
cp "$FROM_FILE" "$TO_FILE"

# Use portable sed (works on Linux)
sed -i "s/\"env\": \".*\"/\"env\": \"${TO_ENV}\"/" "$TO_FILE"

echo "✅ Promoted $FROM_ENV → $TO_ENV: Created $TO_FILE"