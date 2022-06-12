import 'dart:io';

import 'package:batch28_api_starter/repository/product_repository.dart';
import 'package:batch28_api_starter/utils/display_message.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  File? _image;

  final _picker = ImagePicker();
  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
        _addProduct(_image!);
      });
    }
  }

  // Implementing the camera
  Future<void> _openCamera() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
        _addProduct(_image!);
      });
    }
  }

  _addProduct(File file) async {
    bool isAdded = await ProductRepository().addProduct(file);
    if (isAdded) {
      _displayMessage(true);
    } else {
      _displayMessage(false);
    }
  }

  _displayMessage(bool isAdded) {
    if (isAdded) {
      displaySuccessMessage(context, 'Product added successfully');
    } else {
      // displayErrorMessage(context, 'Failed to add product');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(238, 30, 106, 248),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(238, 30, 106, 248),
        title: const Text('Profile'),
        actions: [
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
            ),
          ],
      ),
      body: Center(
          child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 300,
            color: Colors.grey[300],
            child: _image != null
                ? Image.file(_image!, fit: BoxFit.cover)
                : const Text('Please select an image'),
          ),
          Row(
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.add_a_photo),
                onPressed: () {
                  _openCamera();
                },
                label: const Text(''),
              ),
              const SizedBox(width: 40),
              ElevatedButton.icon(
                icon: const Icon(Icons.browse_gallery),
                onPressed: () {
                  _openImagePicker();
                },
                label: const Text(''),
              ),
            ],
          )
        ],
      )),
    );
  }
}
