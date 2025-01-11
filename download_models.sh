#!/bin/bash

set -e

COMFYUI_DIR="<your path to comfyui>"

# Base
echo "⏳🎨 Downloading base models..."
if [ ! -f "$COMFYUI_DIR/models/checkpoints/animagine-xl-3.1.safetensors" ]; then
    curl -L https://huggingface.co/cagliostrolab/animagine-xl-3.1/resolve/main/animagine-xl-3.1.safetensors -o $COMFYUI_DIR/models/checkpoints/animagine-xl-3.1.safetensors
    echo "✅🎨 Successfully downloaded base models..."
else
    echo "✅🎨 Base models already exist, skipping download..."
fi

# CLIP
echo "⏳📷 Downloading CLIP models..."
if [ ! -f "$COMFYUI_DIR/models/clip_vision/CLIP-ViT-H-14-laion2B-s32B-b79K.safetensors" ]; then
    curl -L https://huggingface.co/laion/CLIP-ViT-H-14-laion2B-s32B-b79K/resolve/main/open_clip_pytorch_model.safetensors -o $COMFYUI_DIR/models/clip_vision/CLIP-ViT-H-14-laion2B-s32B-b79K.safetensors
    echo "✅📷 Successfully downloaded CLIP models..."
else
    echo "✅📷 CLIP models already exist, skipping download..."
fi

# ControlNet
echo "⏳🕹️ Downloading ControlNet models..."
if [ ! -f "$COMFYUI_DIR/models/controlnet/controlnet-canny-sdxl-1.0.safetensors" ]; then
    curl -L https://huggingface.co/diffusers/controlnet-canny-sdxl-1.0/resolve/main/diffusion_pytorch_model.safetensors -o $COMFYUI_DIR/models/controlnet/controlnet-canny-sdxl-1.0.safetensors
fi
if [ ! -f "$COMFYUI_DIR/models/controlnet/OpenPoseXL2.safetensors" ]; then
    curl -L https://huggingface.co/thibaud/controlnet-openpose-sdxl-1.0/resolve/main/OpenPoseXL2.safetensors -o $COMFYUI_DIR/models/controlnet/OpenPoseXL2.safetensors
fi
if [ ! -f "$COMFYUI_DIR/models/controlnet/mistoLine_rank256.safetensors" ]; then
    curl -L https://huggingface.co/TheMistoAI/MistoLine/resolve/main/mistoLine_rank256.safetensors -o $COMFYUI_DIR/models/controlnet/mistoLine_rank256.safetensors
    echo "✅🕹️ Successfully downloaded ControlNet models..."
else
    echo "✅🕹️ ControlNet models already exist, skipping download..."
fi

# Face Detection
echo "⏳👤 Downloading face detection models..."

## https://huggingface.co/MonsterMMORPG/tools/resolve/main/antelopev2.zip
if [ ! -f "$COMFYUI_DIR/models/insightface/models/antelopev2.zip" ]; then
    mkdir -p $COMFYUI_DIR/models/insightface/models
    curl -L https://huggingface.co/MonsterMMORPG/tools/resolve/main/antelopev2.zip -o $COMFYUI_DIR/models/insightface/models/antelopev2.zip
    unzip $COMFYUI_DIR/models/insightface/models/antelopev2.zip -d $COMFYUI_DIR/models/insightface/models/antelopv2.zip
    rm $COMFYUI_DIR/models/insightface/models/antelopev2.zip
fi
if [ ! -f "$COMFYUI_DIR/models/pulid/ip-adapter_pulid_sdxl_fp16.safetensors" ]; then
    mkdir -p $COMFYUI_DIR/models/pulid
    curl -L https://huggingface.co/Hishambarakat/checkpoint/resolve/main/ip-adapter_pulid_sdxl_fp16.safetensors -o $COMFYUI_DIR/models/pulid/ip-adapter_pulid_sdxl_fp16.safetensors
    echo "✅👤 Successfully downloaded face detection models..."
else
    echo "✅👤 Face detection models already exist, skipping download..."
fi

# IP Adapter
echo "⏳🔌 Downloading IP Adapter models..."
mkdir -p $COMFYUI_DIR/models/ipadapter
if [ ! -f "$COMFYUI_DIR/models/ipadapter/ip-adapter-plus_sdxl_vit-h.safetensors" ]; then
    curl -L https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter-plus_sdxl_vit-h.safetensors -o $COMFYUI_DIR/models/ipadapter/ip-adapter-plus_sdxl_vit-h.safetensors
    echo "✅🔌 Successfully downloaded IP Adapter models..."
else
    echo "✅🔌 IP Adapter models already exist, skipping download..."
fi

# Upscaler
echo "⏳🔍 Downloading upscaler models..."
if [ ! -f "$COMFYUI_DIR/models/upscale_models/4x-AnimeSharp.pth" ]; then
    curl -L https://huggingface.co/utnah/esrgan/resolve/main/4x-AnimeSharp.pth -o $COMFYUI_DIR/models/upscale_models/4x-AnimeSharp.pth
fi
if [ ! -f "$COMFYUI_DIR/models/upscale_models/ldsr.ckpt" ]; then
    curl -L https://huggingface.co/utnah/LDSR/resolve/main/model.ckpt -o $COMFYUI_DIR/models/upscale_models/ldsr.ckpt
    echo "✅🔍 Successfully downloaded upscaler models..."
else
    echo "✅🔍 Upscaler models already exist, skipping download..."
fi

# VAE
echo "⏳🔬 Downloading VAE models..."
if [ ! -f "$COMFYUI_DIR/models/vae/sdxl_vae.safetensors" ]; then
    curl -L https://huggingface.co/stabilityai/sdxl-vae/resolve/main/sdxl_vae.safetensors -o $COMFYUI_DIR/models/vae/sdxl_vae.safetensors
    echo "✅🔬 Successfully downloaded VAE models..."
else
    echo "✅🔬 VAE models already exist, skipping download..."
fi