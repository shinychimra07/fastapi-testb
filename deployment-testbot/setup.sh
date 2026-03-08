#!/bin/bash
set -e

# TestBot Setup Script for FastAPI
# This script starts the FastAPI service

# Change to script directory
cd "$(dirname "$0")"

echo "Current directory: $(pwd)"
echo "Checking for app directory..."
if [ ! -d "../app" ]; then
    echo "ERROR: ../app directory not found!"
    ls -la ..
    exit 1
fi

echo "Checking for app/main.py..."
if [ ! -f "../app/main.py" ]; then
    echo "ERROR: ../app/main.py not found!"
    ls -la ../app
    exit 1
fi

echo "Starting FastAPI service..."
docker compose up -d

echo "Waiting for service to be ready..."
# Brief wait for container to initialize
sleep 5

echo "Checking container status..."
docker compose ps

echo "✓ FastAPI setup complete"

# Optional: Output JSON for TestBot to override baseUrl
# echo '{"baseUrl":"http://localhost:8000"}'
