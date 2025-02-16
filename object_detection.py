import cv2
import argparse
from ultralytics import YOLO
import sys

def parse_args():
    parser = argparse.ArgumentParser(description='Object detection from IP camera using YOLOv8')
    parser.add_argument('--camera-url', type=str, required=True,
                      help='IP camera URL (e.g., http://username:password@ip_address:port/video)')
    return parser.parse_args()

def main():
    # Parse command line arguments
    args = parse_args()
    camera_url = args.camera_url

    # Initialize YOLOv8 model
    try:
        model = YOLO('yolov8n.pt')  # Load YOLOv8 nano model
    except Exception as e:
        print(f"Error loading YOLO model: {e}")
        sys.exit(1)

    # Initialize video capture
    try:
        cap = cv2.VideoCapture(camera_url)
        if not cap.isOpened():
            raise Exception("Failed to open camera stream")
    except Exception as e:
        print(f"Error accessing camera: {e}")
        sys.exit(1)

    print("Starting object detection... Press 'q' to quit")

    while True:
        # Read frame from camera
        ret, frame = cap.read()
        if not ret:
            print("Error reading frame from camera")
            break

        try:
            # Perform object detection
            results = model(frame, conf=0.5)  # confidence threshold of 0.5
            
            # Visualize results on frame
            annotated_frame = results[0].plot()
            
            # Display the frame
            cv2.imshow('Object Detection', annotated_frame)

            # Break loop if 'q' is pressed
            if cv2.waitKey(1) & 0xFF == ord('q'):
                break

        except Exception as e:
            print(f"Error during object detection: {e}")
            break

    # Clean up
    cap.release()
    cv2.destroyAllWindows()

if __name__ == "__main__":
    main()
