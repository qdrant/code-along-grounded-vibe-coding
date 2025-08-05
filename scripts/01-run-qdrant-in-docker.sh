#!/bin/bash

# Run Qdrant in a docker container
docker run -p 6333:6333 -p 6334:6334 -d \
    -v "$(pwd)/qdrant_storage:/qdrant/storage:z" \
    --name qdrant \
    qdrant/qdrant:v1.15.1
