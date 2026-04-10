# Piper Pro Voice - High Fidelity Local TTS for OpenClaw

Piper Pro Voice is a refined text-to-speech implementation for OpenClaw that moves beyond basic synthesis. It introduces a **Pronunciation Layer** and a **Voice Management** system to eliminate robotic artifacts and provide a more natural human experience.

## 🌟 Key Features
- **Pronunciation Mapping**: A dedicated guide to map problematic words to phonetic equivalents (e.g., "winds" -> "windz").
- **Multi-Fidelity Voices**: Support for various ONNX voice models (Low, Medium, High).
- **Zero-Latency Local Execution**: Runs entirely on-device with no cloud APIs or costs.
- **Telegram/Discord Ready**: Integrated pipeline for delivering high-quality MP3 voice notes.

## 🛠️ Installation
1. Install the `piper` binary and `ffmpeg` on your host.
2. Download the desired ONNX voice models to the `voices/` directory.
3. Configure your `TOOLS.md` with the paths to your models.

## 📖 The Pronunciation Layer
The secret to natural speech in Piper is the pronunciation guide. Instead of sending raw text, the agent processes text through a mapping file:

**Example Mapping:**
- `degrees` ➔ `de-grees`
- `winds` ➔ `windz`
- `AI` ➔ `A-I`

## 🚀 Usage
Use the provided scripts to generate audio:
`echo "Your text here" | ./scripts/speak.sh`

## 📦 Structure
- `/scripts`: Core synthesis and conversion scripts.
- `/voices`: ONNX models and config files.
- `pronunciation.md`: The phonetic mapping guide.
