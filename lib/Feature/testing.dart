import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Testing extends StatefulWidget {
  const Testing({super.key});

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  final RxList<File?> rowImages = List<File?>.filled(3, null).obs;

  // RxList<File> rowImages = <File>[].obs;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Image Picker'),
        ),
        body: ListView.builder(
          itemCount: rowImages.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Image ${index + 1}'),
              subtitle: (rowImages[index] != null)
                  ? Image.file(rowImages[index]!)
                  : const Text('No Image Selected'),
              onTap: () {
                pickImage(index);
              },
            );
          },
        ),
      ),
    );
  }

  void pickImage(int index) async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      final capturedFile = File(image.path);
      setState(() {
        rowImages[index] = capturedFile;
      });
    }
  }
}
