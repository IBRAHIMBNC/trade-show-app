import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/k_icons.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/core/extensions/double.dart';
import 'package:supplier_snap/app/modules/files/presentation/widgets/file_card.dart';
import 'package:supplier_snap/app/widgets/empty_state.dart';
import 'package:supplier_snap/app/widgets/my_appbar.dart';

import 'files_listing_controller.dart';

class FilesListingView extends GetView<FilesListingController> {
  const FilesListingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Files',
        actionBtnTitle: 'Add File',
        onActionBtnPressed: controller.showAddFileSheet,
        onSearchChanged: (val) {},
      ),
      body: Obx(() => _builBody()),
    );
  }

  Widget _builBody() {
    if (controller.files.isEmpty) {
      return EmptyState(
        onAddTap: controller.showAddFileSheet,
        title: 'No files available',
        iconPath: KIcons.emptyFiles,
        btnTitle: 'Add File',
      );
    }
    return GridView.builder(
      padding: kPadding20.all,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.9,
      ),
      itemCount: controller.files.length,
      itemBuilder: (context, index) {
        final file = controller.files[index];
        return FileCard(
          file: file,
          onTap: () => controller.onFileTap(file),
          onEditTap: () => controller.showAddFileSheet(document: file),
          onDeleteTap: () => controller.deleteFile(file),
        );
      },
    );
  }
}
