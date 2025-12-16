import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/core/extensions/double.dart';
import 'package:supplier_snap/app/widgets/custom_image.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/rounded_button/my_rounded_button.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.onAddTap,
    required this.title,
    required this.iconPath,
    required this.btnTitle,
  });

  final Function() onAddTap;
  final String title;
  final String iconPath;
  final String btnTitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: kPadding44.hp,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: KColors.primaryBg,
              radius: 50.r,
              child: CustomImage.icon(iconPath, size: 45.sp),
            ),
            24.verticalSpace,

            CustomText.label16b600(
              title,
              color: KColors.black40,
              textAlign: TextAlign.center,
            ),
            24.verticalSpace,

            RoundedButton(
              Row(
                children: [
                  Icon(Icons.add, color: KColors.black, size: 25.r),
                  8.horizontalSpace,
                  CustomText.label16b600(btnTitle, color: KColors.black),
                ],
              ),
              onTap: onAddTap,
            ),
            80.verticalSpace,
          ],
        ),
      ),
    );
  }
}
