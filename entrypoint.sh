#!/bin/bash
set -e

# Патчим start.sh чтобы ComfyUI нашёл модели в /model-cache/
# Делаем это ДО запуска start.sh, не трогая /workspace
sed -i 's|python main\.py|python main.py --extra-model-paths-config /extra_model_paths.yaml|g' /start.sh

exec /start.sh
