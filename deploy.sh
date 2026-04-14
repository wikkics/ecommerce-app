#!/bin/bash

echo "Stopping existing container..."

docker compose down

echo "Starting new container..."

docker compose up -d

echo "Application deployed successfully!"
