#!/bin/bash
set -e

echo "Running model copy..."
/bin/bash /copy_models.sh

mkdir -p /workspace/runpod-slim
touch /workspace/runpod-slim/comfyui_args.txt

echo "Installing custom nodes..."
cd /workspace/ComfyUI/custom_nodes

install_if_missing () {
    if [ ! -d "$2" ]; then
        git clone "$1" "$2"
    fi
}

install_if_missing https://github.com/Kijai/ComfyUI-WanVideoWrapper ComfyUI-WanVideoWrapper
install_if_missing https://github.com/Kijai/ComfyUI-KJNodes ComfyUI-KJNodes
install_if_missing https://github.com/yolain/ComfyUI-Easy-Use ComfyUI-Easy-Use
install_if_missing https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite ComfyUI-VideoHelperSuite
install_if_missing https://github.com/Kijai/ComfyUI-WanAnimatePreprocess ComfyUI-WanAnimatePreprocess

echo "Starting ComfyUI..."
exec /start.sh
