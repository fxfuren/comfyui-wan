#!/bin/bash
SRC="/model-cache"
DST="/workspace/runpod-slim/ComfyUI/models"

mkdir -p "$DST"
for dir in diffusion_models loras clip_vision vae clip detection; do
    mkdir -p "$DST/$dir"
    for f in "$SRC/$dir"/*; do
        [ -e "$f" ] || continue
        fname=$(basename "$f")
        if [ ! -f "$DST/$dir/$fname" ]; then
            echo "[copy_models] Копирую $dir/$fname ..."
            cp "$f" "$DST/$dir/$fname"
        else
            echo "[copy_models] Уже есть: $dir/$fname — пропускаю"
        fi
    done
done
echo "[copy_models] Готово."
