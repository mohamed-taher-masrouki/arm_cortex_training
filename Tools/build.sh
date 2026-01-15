#!/bin/bash

# 1. Check if the user provided a project name
if [ $# -eq 0 ]; then
    echo "Usage: ./build.sh <ProjectName>"
    echo "Example: ./build.sh HandsOn_CortexM7"
    exit 1
fi

PROJECT_NAME=$1
# Construct the path to the Demos folder
TARGET_PATH="Demos/$PROJECT_NAME"

# 2. Check if that specific Demo folder exists
if [ -d "$TARGET_PATH" ]; then
    echo "--------------------------------------------"
    echo "Building: $PROJECT_NAME"
    echo "Path:     $TARGET_PATH"
    echo "--------------------------------------------"

    # 3. Run make inside the Demo folder
    # -C jumps into the folder, runs make, and jumps back
    make -C "$TARGET_PATH"
    
else
    echo "Error: Project '$PROJECT_NAME' not found in Demos/"
    echo "Looked for: $TARGET_PATH"
    exit 1
fi