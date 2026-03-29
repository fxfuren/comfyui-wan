#!/bin/bash
set -e

# Создаём папку и файл аргументов — start.sh их ожидает
mkdir -p /workspace/runpod-slim
touch /workspace/runpod-slim/comfyui_args.txt

# Добавляем наш конфиг моделей в запуск ComfyUI
sed -i 's|python main\.py|python main.py --extra-model-paths-config /extra_model_paths.yaml|g' /start.sh

exec /start.sh
