
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageSaveScreen extends StatefulWidget {
  const ImageSaveScreen({super.key});

  @override
  State<ImageSaveScreen> createState() => _ImageSaveScreenState();
}

class _ImageSaveScreenState extends State<ImageSaveScreen> {

  // Request storage permissions for Android and iOS
  Future<void> requestPermissions() async {
    if (Platform.isAndroid) {
      // For Android 11 (API level 30) and above, request MANAGE_EXTERNAL_STORAGE for full access
      if (await Permission.manageExternalStorage.isGranted) {
        print("Full storage access granted");
      }
      else {
        // Show a dialog and guide the user to settings if permission is not granted
        if (await Permission.manageExternalStorage.request().isGranted) {
          print("Full storage access granted");
        }
        else {
          print("Full storage access denied");
          _openAppSettings(); // Direct the user to app settings to enable permission manually
        }
      }

      // Request permission for accessing media files (images, videos, etc.)
      if (await Permission.photos.request().isGranted) {
        print("Photo library permission granted");
      }
      else {
        print("Photo library permission denied");
      }
    }
    else if (Platform.isIOS) {
      // iOS-specific permission requests
      if (await Permission.photos.request().isGranted) {
        print("iOS Photo library permission granted");
      } else {
        print("iOS Photo library permission denied");
      }
    }
  }

  // Open the app settings page if MANAGE_EXTERNAL_STORAGE is required but not granted
  Future<void> _openAppSettings() async {
    await openAppSettings();
  }

  // Save image to local storage (using Scoped Storage for Android)
  Future<void> saveImage(Uint8List imageBytes, String fileName) async {
    final directory = await getExternalStorageDirectory();
    final filePath = '${directory!.path}/$fileName';
    final file = File(filePath);
    await file.writeAsBytes(imageBytes as List<int>);

    print('Image saved at: $filePath');
  }

  // Function to pick an image from the gallery (optional)
  Future<void> pickImage() async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Here you can call saveImage to save the picked image to storage
      final Uint8List imageBytes = (await pickedFile.readAsBytes());
      saveImage(imageBytes, 'picked_image.jpg');
    }
    else {
      print("No image selected");
    }
  }

  @override
  void initState() {
    super.initState();
    requestPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Permissions Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                pickImage(); // Pick an image from the gallery
              },
              child: const Text('Pick an Image'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save an empty image (you should use actual image data)
                saveImage(Uint8List(0), 'saved_image.jpg');
              },
              child: const Text('Save Empty Image'),
            ),
          ],
        ),
      ),
    );
  }
}