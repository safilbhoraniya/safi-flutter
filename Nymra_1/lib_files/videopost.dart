import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class storyupload extends StatefulWidget {
  const storyupload({super.key});

  @override
  State<storyupload> createState() => _storyuploadState();
}

class _storyuploadState extends State<storyupload> {
  File? _mediaFile;
  bool _isVideo = false;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return;
    setState(() {
      _mediaFile = File(pickedImage.path);
      _isVideo = false;
    });
  }

  Future<void> _pickVideo() async {
    final pickedVideo = await _picker.pickVideo(source: ImageSource.gallery);
    if (pickedVideo == null) return;
    setState(() {
      _mediaFile = File(pickedVideo.path);
      _isVideo = true;
    });
  }

  Widget _buildPreview()
  {
    if (_mediaFile == null)
    {
      return Container
        (
        height: 200,
        margin: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration
          (
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
          ),
        child: Center
          (
          child: Text
            (
            'No media selected',
            style: TextStyle(
              color: Color(0xFF6B7280),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }

    else
    {
      if (_isVideo)
      {

        return Container
          (
          height: 200,
          margin: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
            image: DecorationImage
              (
              image: FileImage(_mediaFile!),
              fit: BoxFit.cover,
            ),
          ),
          child: Center
            (
            child: Container
              (
              decoration: BoxDecoration
                (
                color: Colors.black.withOpacity(0.4),
                shape: BoxShape.circle,
                 ),
              child: Padding
                (
                padding: EdgeInsets.all(12.0),
                child: Icon(
                  Icons.play_arrow_rounded,
                  size: 48,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      } else
      {
        return Container
          (
          height: 200,
          margin: EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration
            (
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
            image: DecorationImage
              (
              image: FileImage(_mediaFile!),
              fit: BoxFit.cover,
            ),
          ),
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView
      (
      child: Column
        (
        children:
        [
          Text
            (
            'Upload a short video or image for your story',
            style: Theme
                .of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          _buildPreview(),
          Row
            (
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              ElevatedButton.icon(
                onPressed: _pickImage,
                icon: const Icon(Icons.image_outlined),
                label: const Text('Pick Image'),
              ),
              const SizedBox(width: 24),
              ElevatedButton.icon(
                onPressed: _pickVideo,
                icon: const Icon(Icons.video_library_outlined),
                label: const Text('Pick Video'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
