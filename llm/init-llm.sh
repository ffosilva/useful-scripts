#!/bin/bash

docker run --gpus all -d -p 8080:8080 -v ~/.cache/llama.cpp:/root/.cache/llama.cpp -v ~/.cache/huggingface:/root/.cache/huggingface -n llama-cpp-gemma-4 ghcr.io/ggml-org/llama.cpp:server-cuda -hf google/gemma-4-12B-it-qat-q4_0-gguf -ngl 99 -c 262144
