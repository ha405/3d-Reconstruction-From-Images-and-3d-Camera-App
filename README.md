# 📸 Structure from Motion (SfM) for 3D Reconstruction & AR Integration

This repository showcases a complete pipeline for reconstructing 3D models from 2D images using Structure from Motion (SfM) techniques. We go from image capture to point cloud generation, and demonstrate a real-world application: **integrating the 3D model into an interactive AR camera app using Flutter.**

<br>

## 🛠️ Project Overview

We've built a robust SfM pipeline from the ground up, encompassing:

*   **Image Acquisition & Preprocessing:**
    *   Standardizing images through resizing, brightness adjustments, and noise reduction.
    *   Experimenting with edge detection and sharpening for enhanced feature extraction.
*   **Feature Matching:**
    *   Leveraging SIFT for feature detection.
    *   Employing FLANN with a ratio test and RANSAC for robust matching.
*   **Camera Pose Estimation:**
    *   Calculating camera intrinsics.
    *   Estimating pose using essential matrix decomposition, opting for this over quaternion-based rotation due to better compatibility with intrinsic calibration.
*   **3D Point Triangulation:**
    *   Recovering 3D coordinates of scene points from matched 2D points.
*   **Point Cloud Generation:**
    *   Visualizing the reconstructed geometry as a point cloud, with optional filtering and scaling.
*   **AR Integration:**
    *   **Deploying the reconstructed 3D model into an AR application made with Flutter.**

<br>

## ⚙️ Technical Details

### Key Libraries & Tools
  * **OpenCV**: For all image processing and fundamental matrix computations.
  * **Open3D & Matplotlib**: For visualizing the point cloud.
  * **Flutter**: For building the interactive AR camera application.

### Core Pipeline Components
  1.  **Image Preprocessing**: Preparation of images before feature matching.
  2.  **Feature Extraction and Matching**: Finding corresponding points in multiple images using SIFT, FLANN and RANSAC.
  3.  **Camera Intrinsics and Pose**: Determining the essential matrix, relative camera positions and orientations using essential matrix decomposition and linear least-squares optimization.
  4.  **3D Triangulation**: Reconstructing scene points from their projected image locations by using linear least-squares optimization.
  5.  **Point Cloud Generation**: Storing the reconstructed scene geometry as a point cloud and generating an interactive point cloud visualization.
  6.  **AR App Integration**: Using the generated point cloud to reconstruct and visualize the 3D models in the real world.

<br>
