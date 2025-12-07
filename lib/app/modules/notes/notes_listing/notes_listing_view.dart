import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/widgets/my_appbar.dart';

import 'notes_listing_controller.dart';

class NotesListingView extends GetView<NotesListingController> {
  const NotesListingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Notes',
        addBtnTitle: 'Add Note',
        onAddBtnPressed: () {},
        onSearchChanged: (val) {},
      ),
      body: const Center(
        child: Text(
          'NotesListingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
