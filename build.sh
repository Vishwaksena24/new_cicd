#!/bin/bash

# Login to Docker Hub
echo "$DOCKER_PASS" | docker login -u "$DOCKER_USERNAME" --password-stdin

# Stop existing container
docker stop react 2>/dev/null || true
docker rm react 2>/dev/null || true

# Build image
docker build -t react-ci/cd .

# Run container
docker run -d --name react -p 80:80 react-ci/cd

# Tag image
docker tag react-ci/cd vishwak24/cicd

# Push image to Docker Hub
docker push vishwak24/cicd
