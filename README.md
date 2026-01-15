# ARM Cortex Training

## Summary

This repository contains hands-on demos and exercises for ARM Cortex-M/A.  
It provides a ready-to-use environment to explore embedded programming, build and deploy applications, and experiment with Cortex-M/A development.

## Workspace Deployment Guide

This guide shows how to set up a complete development environment for the `arm_cortex_training` repository, including VSCode, ARM toolchains, ST utilities, Renode, and STM32CubeF7.

## 1. Prerequisites

System: Ubuntu/Debian-based Linux.

### 1.1 Essential packages

Update your system and install basic tools:  

sudo apt update  
sudo apt install -y git build-essential cmake curl wget unzip

### 1.2 ARM Toolchain

Install ARM GCC and multi-architecture GDB:  

sudo apt install -y gcc-arm-none-eabi gdb-multiarch

Links:  
ARM GNU Toolchain: https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm  
GDB Multiarch: https://www.gnu.org/software/gdb/

### 1.3 ST Utilities

Install ST-Link tools:  

sudo apt install -y stlink-tools

Link:  
ST-Link / st-utils: https://github.com/stlink-org/stlink

### 1.4 Renode

Install the latest Renode:  

wget -qO- https://download.renode.io/renode.pub.key | sudo gpg --dearmor -o /usr/share/keyrings/renode-archive-keyring.gpg  
echo "deb [signed-by=/usr/share/keyrings/renode-archive-keyring.gpg] https://download.renode.io/deb stable main" | sudo tee /etc/apt/sources.list.d/renode.list  
sudo apt update  
sudo apt install -y renode

Link: https://renode.io/

### 1.5 Visual Studio Code

Install the latest VSCode:  

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg  
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/  
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'  
sudo apt update  
sudo apt install -y code

Link: https://code.visualstudio.com/

## 2. Workspace Setup

### 2.1 Create Workspace

mkdir arm_cortex_workspace  
cd arm_cortex_workspace

### 2.2 Clone Repository as Demos

git clone https://github.com/mohamed-taher-masrouki/arm_cortex_training Demos

### 2.3 Run Deployment Script

cd Demos
./deploy.sh

After running, the workspace will look like:

arm_cortex_workspace/  
├── .vscode/  
├── Demos/  
│   └── deploy.sh  
└── Platforms/  
    └── STM32CubeF7/

### 2.4 Go back to the workspace root
cd ..

### 2.5 Open VS Code in the workspace
code .

### 2.6 Run the build script and enjoy!
./build.sh