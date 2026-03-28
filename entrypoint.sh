#!/bin/bash
set -e

echo "Running model copy..."
/bin/bash /copy_models.sh

# FIX runpod bug
mkdir -p /workspace/runpod-slim
touch /workspace/runpod-slim/comfyui_args.txt

echo "Starting original RunPod start.sh..."
exec /start.sh
