#!/bin/bash
# Trinity agent initialization script
# This script is run by Trinity when the agent container starts

set -e

echo "Initializing Cornelius agent..."

# Check for required environment variables
if [ -z "$SMART_VAULT_PATH" ]; then
    echo "Warning: SMART_VAULT_PATH not set"
fi

if [ -z "$GEMINI_API_KEY" ]; then
    echo "Warning: GEMINI_API_KEY not set"
fi

# Verify Brain directory exists
if [ ! -d "Brain" ]; then
    echo "Error: Brain directory not found!"
    exit 1
fi

# Create memory directory if it doesn't exist
mkdir -p .claude/memory

echo "Cornelius agent initialized successfully"
