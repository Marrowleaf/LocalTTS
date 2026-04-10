#!/bin/bash
# speak.sh - Core synthesis script for Piper Pro Voice

# Defaults - can be overridden by environment variables
MODEL_PATH=${MODEL_PATH:-"/root/.openclaw/workspace/voices/vits-piper-en_US-amy-medium/en_US-amy-medium.onnx"}
CONFIG_PATH=${CONFIG_PATH:-"/root/.openclaw/workspace/voices/vits-piper-en_US-amy-medium/en_US-amy-medium.onnx.json"}
OUTPUT_WAV="/tmp/piper_pro.wav"
OUTPUT_MP3="/root/.openclaw/workspace/media/voice_pro.mp3"

# Read from stdin
INPUT_TEXT=$(cat)

if [ -z "$INPUT_TEXT" ]; then
    echo "Error: No input text provided."
    exit 1
fi

# Synthesize
echo "$INPUT_TEXT" | piper --model "$MODEL_PATH" --config "$CONFIG_PATH" --output_file "$OUTPUT_WAV"

# Convert to MP3 for delivery
ffmpeg -y -i "$OUTPUT_WAV" "$OUTPUT_MP3"

echo "Success: Audio generated at $OUTPUT_MP3"
