import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/k_icons.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/core/extensions/double.dart';
import 'package:supplier_snap/app/widgets/custom_image.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/my_container.dart';
import 'package:supplier_snap/app/widgets/rounded_button/my_rounded_button.dart';

class AlertSheet extends StatelessWidget {
  const AlertSheet({
    super.key,
    this.message,
    required this.title,
    this.imagePath,
  });

  final String? message;
  final String title;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      width: double.infinity,
      color: KColors.white,
      padding: kPadding16.hp,
      radius: 20.r,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          16.verticalSpace,
          MyContainer(height: 5.h, width: 40.w, color: KColors.black40),
          16.verticalSpace,
          CircleAvatar(
            radius: 44.r,
            backgroundColor: KColors.primaryBg,
            child: CustomImage.icon(imagePath ?? KIcons.alert, size: 44.sp),
          ),
          16.verticalSpace,
          CustomText.label24b800(title, fontWeight: FontWeight.w600),
          8.verticalSpace,
          if (message != null)
            CustomText.label12b400(
              message ?? '',
              color: KColors.black60,
              textAlign: TextAlign.center,
            ),
          24.verticalSpace,

          RoundedButton('Done', onTap: Get.back),
          32.verticalSpace,
        ],
      ),
    );
  }
}
