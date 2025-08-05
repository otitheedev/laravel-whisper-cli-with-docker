## This setup includes:

✅ Laravel app
✅ Python + Whisper CLI installed
✅ FFmpeg
✅ API to upload and transcribe audio using Whisper
✅ Volume mount for sharing audio files


## Project Structure
laravel-whisper/
├── app/
│   └── (Laravel app will be here)
├── docker/
│   └── whisper.dockerfile
├── docker-compose.yml
├── .env
└── README.md


## Run it!
cd laravel-whisper
docker-compose up --build


## Test it with CURL
`curl -X POST http://localhost:8000/speech-to-text \
  -F "audio=@/full/path/to/your/audio.mp3"`

## Notes
Whisper runs inside Docker — no internet or API required.

For best performance, use audio at 16kHz or higher.

If needed, convert audio using ffmpeg:

`ffmpeg -i input.mp3 -ar 16000 output.wav`