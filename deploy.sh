#!/bin/bash
# deploy.sh - setup arm_cortex_workspace environment
# Must be run from inside the Demos/ folder

set -e  # exit if any command fails
set -u  # treat unset variables as error

echo "Starting deployment..."


# Step 1: Copy Tools settings to workspace root
if [ -d "Tools/__vscode" ]; then
    echo "Copying VSCode configuration to workspace root..."
    cp -r Tools/__vscode ../.vscode
    cp  Tools/build.sh ../build.sh
    chmod 777 ../build.sh
else
    echo "Error: Tools/_vscode directory not found!"
    exit 1
fi


if [ -d "Tools/__vscode" ]; then
    echo "Copying VSCode configuration to workspace root..."
    cp -r Tools/__vscode ../.vscode
else
    echo "Error: Tools/_vscode directory not found!"
    exit 1
fi

# Step 2: Create Platforms directory
echo "Creating Platforms directory..."
mkdir -p ../Platforms

# Step 3: Clone STM32CubeF7 if it doesn't exist
TARGET_DIR="../Platforms/STM32CubeF7"

if [ -e "$TARGET_DIR" ]; then
    if [ -d "$TARGET_DIR/.git" ]; then
        echo "STM32CubeF7 already exists and is a git repo, skipping..."
    else
        echo "Warning: $TARGET_DIR exists but is invalid. Removing and re-cloning..."
        rm -rf "$TARGET_DIR"
        git clone --recursive https://github.com/STMicroelectronics/STM32CubeF7.git "$TARGET_DIR"
    fi
else
    echo "Cloning STM32CubeF7 repository..."
    git clone --recursive https://github.com/STMicroelectronics/STM32CubeF7.git "$TARGET_DIR"
fi

# Step 4: Go to workspace root
cd ..

echo "Deployment completed!"
echo "Workspace structure:"
ls -R


