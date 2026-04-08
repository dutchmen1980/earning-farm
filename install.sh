#!/bin/sh
set -e

PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Starting Earning Farm installer..."
cd "$PROJECT_DIR"

if [ ! -f .env ]; then
  echo "No .env found."
  echo "Creating .env from .env.example ..."
  cp .env.example .env
  echo
  echo "IMPORTANT:"
  echo "Edit the .env file first, then run this script again."
  exit 0
fi

echo "Pulling latest images..."
docker compose pull

echo "Starting containers..."
docker compose up -d

echo
echo "Done. Current status:"
docker compose ps
