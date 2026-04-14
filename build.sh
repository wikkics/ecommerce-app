#!/bin/bash

echo "Building Docker image..."

docker build -t ecommerce-app:latest .

echo "Docker image built successfully!"
