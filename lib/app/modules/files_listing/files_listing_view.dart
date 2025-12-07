import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/widgets/my_appbar.dart';

import 'files_listing_controller.dart';

class FilesListingView extends GetView<FilesListingController> {
  const FilesListingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Files',
        addBtnTitle: 'Add File',
        onAddBtnPressed: () {},
        onSearchChanged: (val) {},
      ),
      body: const Center(
        child: Text(
          'FilesListingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
