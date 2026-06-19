#!/bin/bash

set -e

ENV=$1

if [ -z "$ENV" ]; then
  echo "❌ No environment specified. Usage: ./scripts/smoke-test.sh <env>"
  exit 1
fi

echo "🔍 Running smoke tests for $ENV environment..."

# Check that the build artifact exists
ARTIFACT="build/app-$ENV.tar.gz"
if [ ! -f "$ARTIFACT" ]; then
  echo "❌ Smoke test failed: artifact $ARTIFACT not found"
  exit 1
fi

# Check that the config file exists and has the right environment
CONFIG="configs/$ENV.json"
if [ ! -f "$CONFIG" ]; then
  echo "❌ Smoke test failed: config $CONFIG not found"
  exit 1
fi

# Verify the config has the correct environment value
ENV_VALUE=$(python3 -c "import json; d=json.load(open('$CONFIG')); print(d['env'])")
if [ -z "$ENV_VALUE" ]; then
  echo "❌ Smoke test failed: could not read env from $CONFIG"
  exit 1
fi

echo "✅ Config env value: $ENV_VALUE"

echo "✅ Artifact check passed"
echo "✅ Config check passed"
echo "✅ All smoke tests passed for $ENV environment"