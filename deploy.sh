#!/bin/bash
set -e

export IMAGE_NAME=doch2/dev:latest

echo "Deploying application using image:  ..."
docker compose down || true
docker compose pull "" || true
docker compose up -d
echo "Application deployed successfully on port 80!"

