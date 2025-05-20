#!/bin/bash

# DockerHub credentials (DO NOT hardcode in production — use GitHub Secrets or ENV vars)
DOCKER_USER="tolanicorpdev"
DOCKER_PASS="dckr_pat_-FVb-fHRrM4B4_ck9CC3ZBD3GNY"
IMAGE_NAME="tolanicorpdev/freakme.fun"
CONTAINER_NAME="freakme-fun"
PORT="5000"

echo "🔐 Logging in to DockerHub..."
echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin

echo "📥 Pulling Docker image: $IMAGE_NAME:latest"
docker pull $IMAGE_NAME:latest

echo "🧹 Cleaning up old containers..."
docker stop $CONTAINER_NAME 2>/dev/null || true
docker rm $CONTAINER_NAME 2>/dev/null || true

echo "🚀 Running container..."
docker run -d --name $CONTAINER_NAME -p $PORT:$PORT $IMAGE_NAME:latest

echo "📦 Container status:"
docker ps -a | grep $CONTAINER_NAME

echo "✅ Deployment complete: http://localhost:$PORT"
