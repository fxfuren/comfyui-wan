#!/bin/bash
set -e

echo "Running model copy..."
/bin/bash /copy_models.sh

echo "Installing custom nodes..."
NODES_DIR="/workspace/runpod-slim/ComfyUI/custom_nodes"
mkdir -p "$NODES_DIR"
cd "$NODES_DIR"

install_if_missing() {
    if [ ! -d "$2" ]; then
        git clone "$1" "$2"
    fi
}

install_if_missing https://github.com/Kijai/ComfyUI-WanVideoWrapper ComfyUI-WanVideoWrapper
install_if_missing https://github.com/Kijai/ComfyUI-KJNodes ComfyUI-KJNodes
install_if_missing https://github.com/yolain/ComfyUI-Easy-Use ComfyUI-Easy-Use
install_if_missing https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite ComfyUI-VideoHelperSuite
install_if_missing https://github.com/Kijai/ComfyUI-WanAnimatePreprocess ComfyUI-WanAnimatePreprocess

echo "Starting original start.sh..."
exec /start.sh
