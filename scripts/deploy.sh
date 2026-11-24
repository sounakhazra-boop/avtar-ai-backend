#!/usr/bin/env bash
set -euo pipefail

echo "Pulling latest code from main..."
git pull origin main

echo "Building and starting gemini-live-backend on port 4030..."

# Check that .env exists before starting
if [ ! -f ".env" ]; then
  echo "Error: .env file not found in $(pwd)"
  exit 1
fi

docker compose down
docker compose up -d --build

echo "Deployment complete. Checking container status..."
docker compose ps
echo "Tail logs with: docker compose logs -f gemini-live-backend"