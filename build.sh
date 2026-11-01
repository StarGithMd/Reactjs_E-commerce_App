#!/bin/bash
set -e

IMAGE_NAME=<your-dockerhub-username>/dev:latest

echo "Building Docker image:  ..."
docker build -t "" .
echo "Docker image  built successfully!"

