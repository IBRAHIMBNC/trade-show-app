import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/k_icons.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/core/extensions/double.dart';
import 'package:supplier_snap/app/modules/notes/data/models/note_model.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/empty_state.dart';
import 'package:supplier_snap/app/widgets/my_appbar.dart';
import 'package:supplier_snap/app/widgets/my_container.dart';

import 'notes_listing_controller.dart';

class NotesListingView extends GetView<NotesListingController> {
  const NotesListingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Notes',
        addBtnTitle: 'Add Note',
        onAddBtnPressed: controller.addEditNote,
        onSearchChanged: (val) {},
      ),
      body: Obx(() => _buildBody()),
    );
  }

  Widget _buildBody() {
    if (controller.notes.isEmpty) {
      return EmptyState(
        onAddTap: controller.addEditNote,
        title: 'No notes available.',
        iconPath: KIcons.emptyNotes,
        btnTitle: 'Add Note',
      );
    }
    return ListView.separated(
      padding: EdgeInsets.symmetric(
        horizontal: kPadding20.w,
        vertical: kPadding12.h,
      ),
      itemBuilder: (context, index) =>
          _buildNoteTIle(noteModel: controller.notes[index]),
      separatorBuilder: (context, index) => 12.verticalSpace,
      itemCount: controller.notes.length,
    );
  }

  MyContainer _buildNoteTIle({required NoteModel noteModel}) {
    return MyContainer(
      onTap: () => controller.addEditNote(noteModel),
      width: double.infinity,
      padding: kPadding16.all,
      border: BorderSide(color: KColors.black5),
      color: KColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            noteModel.title,
            maxLines: 1,
            textAlign: TextAlign.left,
            style: AppTextStyles.label16b600.copyWith(color: KColors.black),
          ),
          8.verticalSpace,
          CustomText(
            noteModel.content,
            style: AppTextStyles.label14b400.copyWith(color: KColors.black60),
            textAlign: TextAlign.left,
            maxLines: 2,
            minSize: 14,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
