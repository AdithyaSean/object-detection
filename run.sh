#!/bin/bash

# Check if Python 3 is installed
if ! command -v python3 &> /dev/null; then
    echo "Python 3 is required but not installed. Please install Python 3 and try again."
    exit 1
fi

# Create and activate virtual environment
echo "Creating virtual environment..."
python3 -m venv venv
source venv/bin/activate

# Install dependencies
echo "Installing required packages..."
pip install --upgrade pip
pip install -r requirements.txt

# Ask for IP camera URL if not provided as argument
if [ $# -eq 0 ]; then
    read -p "Enter IP camera URL (e.g., http://username:password@ip_address:port/video): " camera_url
else
    camera_url=$1
fi

# Run the object detection script
echo "Starting object detection..."
python object_detection.py --camera-url "$camera_url"

# Deactivate virtual environment
deactivate
