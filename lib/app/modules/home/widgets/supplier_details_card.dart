import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/k_icons.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/core/extensions/double.dart';
import 'package:supplier_snap/app/routes/app_pages.dart';
import 'package:supplier_snap/app/widgets/custom_image.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/my_container.dart';
import 'package:supplier_snap/app/widgets/my_list_tile.dart';
import 'package:supplier_snap/app/widgets/we_chat_whatsapp_btn.dart';

class SupplierDetailsCard extends StatelessWidget {
  const SupplierDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      onTap: () {
        Get.toNamed(Routes.SUPPLIER_DETAIL);
      },
      padding: kPadding8.all,
      width: double.infinity,
      radius: 30.r,
      child: Column(
        children: [
          MyListTile(
            border: BorderSide(color: KColors.white, width: 1),
            radius: 50.r,
            padding: kPadding8.all,
            leading: CircleAvatar(
              radius: 32.r,
              backgroundColor: KColors.brand,
              child: CircleAvatar(radius: 30.r, backgroundColor: KColors.white),
            ),
            title: CustomText.label18b600('Bernard'),
            verticalSpacing: 4.h,
            subtitle: Row(
              children: [
                CircleAvatar(
                  radius: 6.r,
                  backgroundColor: KColors.successColor,
                ),
                6.horizontalSpace,
                CustomText.label10b400('Saudi | Booth B12'),
              ],
            ),
            trailing: MyContainer(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
              color: KColors.white,
              radius: 30.r,
              child: Row(
                children: [
                  MyContainer(
                    radius: 30.r,
                    padding: EdgeInsets.symmetric(
                      vertical: 8.h,
                      horizontal: 12.w,
                    ),
                    color: KColors.primaryBg,
                    child: CustomImage.icon(KIcons.ranking, size: 22.w),
                  ),
                  8.horizontalSpace,
                  CustomText.label16b600('8', fontWeight: FontWeight.normal),
                  8.horizontalSpace,
                ],
              ),
            ),
          ),
          12.verticalSpace,

          Row(
            spacing: 4.w,
            children: [
              _buildCountContainer(title: 'Products', count: '4'),

              _buildCountContainer(title: 'Files', count: '12'),

              _buildCountContainer(title: 'Notes', count: '85'),
            ],
          ),
          12.verticalSpace,

          WeChatAndWhatsappBtns(),
        ],
      ),
    );
  }

  Expanded _buildCountContainer({
    required String title,
    required String count,
  }) {
    return Expanded(
      child: MyContainer(
        color: KColors.white,
        radius: 30.r,
        padding: kPadding4.all,
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: KColors.primaryBg,
              radius: 16.r,
              child: CustomText.label14b400(count),
            ),
            8.horizontalSpace,
            CustomText.label12b400(title, color: KColors.black60),
          ],
        ),
      ),
    );
  }
}
