import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/core/enums/file_type_enum.dart';
import 'package:supplier_snap/app/core/extensions/dateTime.dart';
import 'package:supplier_snap/app/core/extensions/double.dart';
import 'package:supplier_snap/app/modules/files/data/models/document_model.dart';
import 'package:supplier_snap/app/widgets/custom_image.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/my_container.dart';
import 'package:supplier_snap/app/widgets/my_pop_up.dart';

class FileCard extends StatelessWidget {
  const FileCard({
    super.key,
    required this.file,
    this.onEditTap,
    this.onDeleteTap,
    this.onTap,
  });

  final DocumentModel file;
  final Function()? onTap;
  final Function()? onEditTap;
  final Function()? onDeleteTap;

  @override
  Widget build(BuildContext context) {
    if (file.type == DocumentType.image) {
      return _buildImageCard();
    } else {
      return _buildFileCard();
    }
  }

  _buildFileCard() {
    return MyContainer(
      onTap: onTap,
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
                Spacer(),
                CircleAvatar(
                  backgroundColor: KColors.primaryBg,
                  radius: 35.r,
                  child: Icon(
                    file.type == DocumentType.image
                        ? CupertinoIcons.photo_fill
                        : CupertinoIcons.folder_fill,
                    size: 30.sp,
                    color: KColors.black,
                  ),
                ),
                Spacer(),
                CustomText.label16b600(file.title, maxLines: 1),
                4.verticalSpace,
                CustomText.label12b400(
                  file.createdAt?.formattedDate ?? '',
                  color: KColors.black60,
                ),
                Spacer(),
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

  Widget _buildImageCard() {
    return MyContainer(
      onTap: onTap,
      padding: kPadding4.all,
      border: BorderSide(color: KColors.black10),
      color: Colors.transparent,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (file.type == DocumentType.pdf)
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
                  )
                else
                  CustomImage(
                    file.absolutePath,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    height: 100.h,
                    radius: 16.r,
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
            top: 5.h,
            right: 5.w,
            child: CircleAvatar(
              backgroundColor: KColors.white,
              radius: 12.r,
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
          ),
        ],
      ),
    );
  }
}
