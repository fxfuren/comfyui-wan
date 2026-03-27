# Базируемся на официальном образе хаб-шаблона cw3nka7d08
FROM runpod/comfyui:latest

ENV DEBIAN_FRONTEND=noninteractive

# Модели лежат в /workspace/ComfyUI/models/
WORKDIR /workspace/ComfyUI/models

# ── Diffusion model ──────────────────────────────────────────────────────────
RUN wget -q --show-progress \
    -O diffusion_models/Wan21_SteadyDancer_fp8_e4m3fn_scaled_KJ.safetensors \
    "https://huggingface.co/Kijai/WanVideo_comfy_fp8_scaled/resolve/main/SteadyDancer/Wan21_SteadyDancer_fp8_e4m3fn_scaled_KJ.safetensors"

# ── LoRA ─────────────────────────────────────────────────────────────────────
RUN wget -q --show-progress \
    -O loras/lightx2v_I2V_14B_480p_cfg_step_distill_rank64_bf16.safetensors \
    "https://huggingface.co/dci05049/wan-animate/resolve/main/lightx2v_I2V_14B_480p_cfg_step_distill_rank64_bf16.safetensors"

# ── CLIP Vision ───────────────────────────────────────────────────────────────
RUN wget -q --show-progress \
    -O clip_vision/clip_vision_h.safetensors \
    "https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/clip_vision/clip_vision_h.safetensors"

# ── VAE ───────────────────────────────────────────────────────────────────────
RUN wget -q --show-progress \
    -O vae/Wan2_1_VAE_bf16.safetensors \
    "https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Wan2_1_VAE_bf16.safetensors"

# ── CLIP / Text Encoder ───────────────────────────────────────────────────────
RUN wget -q --show-progress \
    -O clip/umt5-xxl-enc-bf16.safetensors \
    "https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/umt5-xxl-enc-bf16.safetensors"

# ── Detectors ─────────────────────────────────────────────────────────────────
RUN mkdir -p detection && \
    wget -q --show-progress \
        -O detection/yolov10m.onnx \
        "https://huggingface.co/Wan-AI/Wan2.2-Animate-14B/resolve/main/process_checkpoint/det/yolov10m.onnx" && \
    wget -q --show-progress \
        -O detection/vitpose_h_wholebody_data.bin \
        "https://huggingface.co/Kijai/vitpose_comfy/resolve/main/onnx/vitpose_h_wholebody_data.bin" && \
    wget -q --show-progress \
        -O detection/vitpose_h_wholebody_model.onnx \
        "https://huggingface.co/Kijai/vitpose_comfy/resolve/main/onnx/vitpose_h_wholebody_model.onnx" && \
    wget -q --show-progress \
        -O detection/vitpose-l-wholebody.onnx \
        "https://huggingface.co/JunkyByte/easy_ViTPose/resolve/main/onnx/wholebody/vitpose-l-wholebody.onnx"

WORKDIR /
