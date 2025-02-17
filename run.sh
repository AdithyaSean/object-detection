#!/bin/bash

# Check if virtual environment exists
if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
    source venv/bin/activate || { echo "Failed to activate virtual environment"; exit 1; }
    echo "Installing required packages..."
    pip install -r requirements.txt
else
    source venv/bin/activate || { echo "Failed to activate virtual environment"; exit 1; }
fi

# Ask for camera input if not provided as argument
if [ $# -eq 0 ]; then
    echo "Select camera input:"
    echo "1) Webcam"
    echo "2) IP Camera"
    read -p "Enter choice (1/2): " choice
    
    if [ "$choice" = "1" ]; then
        camera_url="0"
    else
        read -p "Enter IP camera URL (e.g., http://username:password@ip_address:port/video): " camera_url
    fi
else
    camera_url=$1
fi

# Run the object detection script
echo "Starting object detection (press 'q' to quit)..."
python object_detection.py --camera-url "$camera_url"

# Deactivate virtual environment
deactivate
