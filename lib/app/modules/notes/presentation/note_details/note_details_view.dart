import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/my_appbar.dart';
import 'package:supplier_snap/app/widgets/my_container.dart';
import 'package:supplier_snap/app/widgets/my_pop_up.dart';

import 'note_details_controller.dart';

class NoteDetailsView extends GetView<NoteDetailsController> {
  const NoteDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Edit Note',
        actions: [
          if (controller.isEditMode)
            MyContainer(
              onTap: () {
                Navigator.of(context).pop();
              },
              height: 40.h,
              width: 32.w,
              color: KColors.primaryBg,
              radius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                bottomLeft: Radius.circular(12.r),
                topRight: Radius.circular(50.r),
                bottomRight: Radius.circular(50.r),
              ),
              child: MyPopupMenu(
                items: ['Delete'],
                onSelected: (val) {
                  if (val == 'Delete') {
                    controller.showDeleteNoteSheet();
                  }
                },
                child: Icon(Icons.more_vert, color: KColors.black, size: 17.r),
              ),
            ),
        ],
      ),
      body: TextField(
        controller: controller.noteController,
        maxLines: null,
        style: AppTextStyles.label14b400.copyWith(
          color: KColors.black,
          height: 1.5,
        ),
        decoration: InputDecoration(
          hintText: 'Enter your note here...',
          hintStyle: AppTextStyles.label14b400.copyWith(
            color: KColors.black40,
            height: 1.5,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(16.w),
        ),
      ),
    );
  }
}
