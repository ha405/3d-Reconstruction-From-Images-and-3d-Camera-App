import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
        ),
      ),
      home: const CameraScreen(),
    );
  }
}

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final ImagePicker _picker = ImagePicker();
  String? _imagePath;

  Future<void> _openCamera() async {
    try {
      final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
      if (photo != null) {
        setState(() {
          _imagePath = photo.path;
        });
      }
    } catch (e) {
      print('Error opening camera: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera App'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                height: 300,
                child: ModelViewer(
                  src: 'assets/output_model.glb',
                  alt: "A 3D model",
                  autoRotate: true,
                  cameraControls: true,
                  ar: true,
                  orientation: "180deg 0deg 0deg",
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                height: 300,
                child: ModelViewer(
                  src: 'assets/path_to_uv_mapped_mesh.glb',
                  alt: "Another 3D model",
                  autoRotate: true,
                  cameraControls: true,
                  orientation: "180deg 0deg 0deg",
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _openCamera,
                icon: const Icon(Icons.camera_alt, color: Colors.black),
                label: const Text('Open Camera', style: TextStyle(color: Colors.black)),
              ),
              if (_imagePath != null)
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.file(
                    File(_imagePath!),
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
