import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/k_icons.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/core/extensions/double.dart';
import 'package:supplier_snap/app/widgets/custom_image.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/custom_text_field.dart';
import 'package:supplier_snap/app/widgets/my_container.dart';
import 'package:supplier_snap/app/widgets/my_list_tile.dart';
import 'package:supplier_snap/app/widgets/rounded_button/my_rounded_button.dart';

class AddEditFileSheet extends StatelessWidget {
  const AddEditFileSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      width: double.infinity,
      padding: kPadding16.all,
      color: KColors.white,
      margin: EdgeInsets.symmetric(
        horizontal: kPadding16.w,
        vertical: kPadding20.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MyContainer(color: KColors.black40, width: 32.w, height: 4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyContainer(
                onTap: Get.back,
                width: 34.w,
                height: 34.h,
                radius: 12.r,
                color: KColors.black5,
                margin: EdgeInsets.only(top: 16.h, bottom: 8.h),
                child: Icon(Icons.close, color: KColors.black60, size: 18.w),
              ),
              CustomText.label18b600('Add File'),
              SizedBox(width: 34.w),
            ],
          ),
          12.verticalSpace,
          CustomTextField(hinText: 'Name'),
          12.verticalSpace,
          MyContainer(
            margin: kPadding12.top,
            // onTap: () => controller.pickImages(),
            radius: 16.r,
            padding: kPadding16.all,
            color: KColors.white,
            border: BorderSide(color: Colors.grey.shade300, width: 1),
            child: MyListTile(
              horizontalSpacing: 12.w,
              leading: CircleAvatar(
                radius: 20.r,
                backgroundColor: KColors.primaryBg,
                child: CustomImage.icon(KIcons.upload, size: 20.sp),
              ),
              title: 'Upload Your File',
              verticalSpacing: 2.h,
              subtitle: 'Suported formats: JPG, PNG, PDF',
            ),
          ),
          24.verticalSpace,
          RoundedButton('Add', onTap: () {}),
        ],
      ),
    );
  }
}
