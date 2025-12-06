import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/core/extensions/double.dart';
import 'package:supplier_snap/app/routes/app_pages.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/my_container.dart';
import 'package:supplier_snap/app/widgets/my_list_tile.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MyListTile(
      onTap: () => Get.toNamed(Routes.PRODUCT_DETAILS),
      padding: kPadding16.all,
      border: BorderSide(color: KColors.black5),
      leading: MyContainer(height: 75.h, width: 75.h),
      title: Row(
        children: [
          CustomText.label14b600('\$100'),
          8.horizontalSpace,
          CustomText.label12b400('(MOQ 50 pcs)', color: KColors.black60),
          Spacer(),
          GestureDetector(child: Icon(Icons.more_vert, size: 20.sp)),
        ],
      ),
      verticalSpacing: 4.h,
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.label16b600('Block jointing'),
          4.verticalSpace,
          CustomText.label12b400('Cement'),
        ],
      ),
    );
  }
}
