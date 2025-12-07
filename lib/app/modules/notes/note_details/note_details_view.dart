import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'note_details_controller.dart';

class NoteDetailsView extends GetView<NoteDetailsController> {
  const NoteDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NoteDetailsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NoteDetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
