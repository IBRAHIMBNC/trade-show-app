import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/k_icons.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/core/enums/file_type_enum.dart';
import 'package:supplier_snap/app/core/extensions/dateTime.dart';
import 'package:supplier_snap/app/core/extensions/double.dart';
import 'package:supplier_snap/app/modules/files/data/models/document_model.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/empty_state.dart';
import 'package:supplier_snap/app/widgets/my_appbar.dart';
import 'package:supplier_snap/app/widgets/my_container.dart';
import 'package:supplier_snap/app/widgets/my_pop_up.dart';

import 'files_listing_controller.dart';

class FilesListingView extends GetView<FilesListingController> {
  const FilesListingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Files',
        addBtnTitle: 'Add File',
        onAddBtnPressed: controller.showAddFileSheet,
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
        childAspectRatio: 1,
      ),
      itemCount: controller.files.length,
      itemBuilder: (context, index) {
        final file = controller.files[index];
        return FileCard(
          file: file,
          onEditTap: () => controller.showAddFileSheet(document: file),
          onDeleteTap: () => controller.deleteFile(file),
        );
      },
    );
  }
}

class FileCard extends StatelessWidget {
  const FileCard({
    super.key,
    required this.file,
    this.onEditTap,
    this.onDeleteTap,
  });

  final DocumentModel file;

  final Function()? onEditTap;
  final Function()? onDeleteTap;

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      padding: kPadding8.hp,
      border: BorderSide(color: KColors.black10),
      color: Colors.transparent,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: KColors.primaryBg,
                  radius: 28.r,
                  child: Icon(
                    file.type == DocumentType.image
                        ? CupertinoIcons.photo_fill
                        : CupertinoIcons.folder_fill,
                    size: 25.sp,
                    color: KColors.black,
                  ),
                ),
                12.verticalSpace,
                CustomText.label16b600(file.title, maxLines: 1),
                4.verticalSpace,
                CustomText.label12b400(
                  file.createdAt?.formattedDate ?? '',
                  color: KColors.black60,
                ),
              ],
            ),
          ),
          Positioned(
            top: 12.h,
            right: 5.w,
            child: MyPopupMenu(
              items: ['Edit', 'Delete'],
              onSelected: (value) {
                if (value == 'Edit') {
                  onEditTap?.call();
                } else if (value == 'Delete') {
                  onDeleteTap?.call();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
