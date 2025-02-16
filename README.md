# IP Camera Object Detection with YOLOv8

This project implements real-time object detection using YOLOv8 on an IP camera feed. The system can detect various objects like people, cars, animals, and more in real-time.

## Requirements

- Python 3.x
- Unix-like environment (Linux/macOS)
- IP camera with accessible video stream URL

## Quick Start

1. Clone or download this repository
2. Make the run script executable (if not already):
   ```bash
   chmod +x run.sh
   ```
3. Run the program:
   ```bash
   ./run.sh
   ```
   - You will be prompted to enter your IP camera URL
   - OR provide the URL directly:
     ```bash
     ./run.sh "http://username:password@ip_address:port/video"
     ```

## What It Does

The program will:
1. Set up a Python virtual environment
2. Install all required dependencies
3. Load the YOLOv8 model
4. Connect to your IP camera
5. Display a window showing the camera feed with detected objects outlined and labeled

## IP Camera URL Format

The camera URL format depends on your IP camera's make and model. Common formats include:
- `http://username:password@ip_address:port/video`
- `rtsp://username:password@ip_address:port/stream`
- `http://ip_address:port/video.mjpg`

Check your camera's documentation for the correct URL format.

## Controls

- Press 'q' to quit the program
- The detection window will show object bounding boxes and labels in real-time

## Files

- `run.sh` - All-in-one setup and execution script
- `object_detection.py` - Main Python script for object detection
- `requirements.txt` - Python package dependencies

## Troubleshooting

1. If the program can't connect to your camera:
   - Verify the camera URL is correct
   - Ensure the camera is powered on and connected to your network
   - Check if you can access the camera stream in a media player like VLC

2. If you see "Python 3 is required" error:
   - Install Python 3 for your operating system
   - Ensure Python 3 is in your system PATH

3. If detection seems slow:
   - The program uses YOLOv8n (nano) model by default for balance of speed and accuracy
   - Consider reducing the camera resolution if available
   - Make sure you have a stable network connection to the IP camera
