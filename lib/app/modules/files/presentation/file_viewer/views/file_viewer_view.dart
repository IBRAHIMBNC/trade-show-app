import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/file_viewer_controller.dart';

class FileViewerView extends GetView<FileViewerController> {
  const FileViewerView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FileViewerView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FileViewerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
