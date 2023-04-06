import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';

class ImageUploadWidget extends StatefulWidget {
  final ValueChanged<File?> onImageSelected;

  const ImageUploadWidget({
    Key? key,
    required this.onImageSelected,
  }) : super(key: key);

  @override
  _ImageUploadWidgetState createState() => _ImageUploadWidgetState();
}

class _ImageUploadWidgetState extends State<ImageUploadWidget> {
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;

  Future<void> _getImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: 800,
        maxHeight: 800,
      );

      if (pickedFile == null) return;

      setState(() {
        _imageFile = File(pickedFile.path);
        print(_imageFile);
      });

      widget.onImageSelected(_imageFile);
    } catch (e) {
      print('Error while picking an image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150,
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: AppColors.primary,
                ),
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _imageFile != null
                    ? FileImage(_imageFile!)
                    : AssetImage('assets/images/default_avatar.jpg')
                        as ImageProvider<Object>,
                child: IconButton(
                  icon: Icon(Icons.camera_alt),
                  onPressed: () => _getImage(ImageSource.gallery),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
