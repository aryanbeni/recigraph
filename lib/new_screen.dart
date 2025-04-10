import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ImageUploadWidget extends StatefulWidget {
  @override
  _ImageUploadWidgetState createState() => _ImageUploadWidgetState();
}

class _ImageUploadWidgetState extends State<ImageUploadWidget> {
  File? _imageFile;
  String? _recipe;
  bool _isLoading = false;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      _uploadImageAndGenerateRecipe();
    }
  }

  Future<void> _uploadImageAndGenerateRecipe() async {
    if (_imageFile == null) return;

    setState(() {
      _isLoading = true;
    });

    try {
      // Replace with your backend API endpoint
      final response = await http.post(
        Uri.parse('https://your-backend-api.com/generate-recipe'),
        body: {
          'image': base64Encode(_imageFile!.readAsBytesSync()),
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          _recipe = json.decode(response.body)['recipe'];
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Error generating recipe: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recipe Generator')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _imageFile != null
                ? Image.file(_imageFile!, height: 200)
                : Text('No image selected'),

            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Upload Food Image'),
            ),

            _isLoading
                ? CircularProgressIndicator()
                : _recipe != null
                ? Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(_recipe!, textAlign: TextAlign.center),
            )
                : SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}