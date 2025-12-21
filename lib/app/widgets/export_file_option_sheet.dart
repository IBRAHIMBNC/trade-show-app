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

class ExportOptionSheet extends StatelessWidget {
  const ExportOptionSheet({super.key, this.onExcelTap, this.onCsvTap});
  final Function()? onExcelTap;
  final Function()? onCsvTap;

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      color: KColors.white,
      radius: 20.r,
      margin: kPadding12.all,
      padding: kPadding16.all,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          16.verticalSpace,
          MyContainer(height: 5.h, width: 40.w, color: KColors.black40),
          12.verticalSpace,
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
              CustomText.label18b600('Export Options'),
              SizedBox(width: 34.w),
            ],
          ),
          16.verticalSpace,
          Row(
            spacing: 20.w,
            children: [
              _buildOptionCard(
                title: 'Excel',
                iconPath: KIcons.exportFile,
                ext: '.XLS',
                onTap: onExcelTap,
              ),
              _buildOptionCard(
                title: 'CSV',
                iconPath: KIcons.exportFile,
                ext: '.CSV',
                onTap: onCsvTap,
              ),
            ],
          ),
          20.verticalSpace,
        ],
      ),
    );
  }

  Expanded _buildOptionCard({
    required String title,
    required String iconPath,
    required String ext,
    Function()? onTap,
  }) {
    return Expanded(
      child: MyContainer(
        onTap: onTap,
        alignment: Alignment.center,
        height: 115.h,
        width: 100.w,
        color: KColors.primaryBg,
        padding: kPadding8.all,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                CustomImage.icon(iconPath, size: 50.sp),
                Positioned(
                  right: 0,
                  bottom: 6.h,
                  left: 0,
                  child: CustomText.label12b400(
                    ext,
                    textAlign: TextAlign.center,
                    color: KColors.white,
                  ),
                ),
              ],
            ),
            8.verticalSpace,
            CustomText.label14b600(title),
          ],
        ),
      ),
    );
  }
}
