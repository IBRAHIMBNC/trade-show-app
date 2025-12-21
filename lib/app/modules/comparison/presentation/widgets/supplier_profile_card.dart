import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/k_icons.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/core/extensions/double.dart';
import 'package:supplier_snap/app/modules/supplier/data/models/supplier_model.dart';
import 'package:supplier_snap/app/widgets/custom_image.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/my_container.dart';
import 'package:supplier_snap/app/widgets/my_list_tile.dart';

class SupplierProfileCard extends StatelessWidget {
  const SupplierProfileCard({super.key, required this.supplier, this.onTap});
  final SupplierModel supplier;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return MyListTile(
      color: KColors.primaryBg,
      border: BorderSide(color: KColors.white, width: 1),
      radius: 50.r,
      padding: kPadding8.all,
      leading: Row(
        children: [
          CircleAvatar(
            radius: 28.r,
            backgroundColor: KColors.brand,
            child: CustomImage.cirlce(
              supplier.absoluteImagePath ?? supplier.imageUrl ?? '',
              size: 53.w,
              hideChild:
                  (supplier.absoluteImagePath ?? supplier.imageUrl) != null,
              backgroundColor: KColors.white,
              child: CustomImage.icon(
                KIcons.user,
                size: 22.sp,
                color: KColors.black,
              ),
            ),
          ),
        ],
      ),
      horizontalSpacing: 8.w,
      title: Padding(
        padding: kPadding8.right,
        child: CustomText.label16b600(
          supplier.name,
          maxLines: 2,
          fontWeight: FontWeight.w600,
        ),
      ),
      verticalSpacing: 2.h,
      subtitle: Row(
        children: [
          Expanded(
            child: CustomText.label12b400(
              supplier.email ?? supplier.phone ?? supplier.company,
              maxLines: 1,
              color: KColors.black60,
            ),
          ),
        ],
      ),
      trailing: MyContainer(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
        color: KColors.white,
        radius: 30.r,
        child: Row(
          children: [
            MyContainer(
              radius: 30.r,
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
              color: KColors.primaryBg,
              child: CustomImage.icon(KIcons.ranking, size: 16.w),
            ),
            8.horizontalSpace,
            CustomText.label14b600(
              supplier.scores.total.toString(),
              fontWeight: FontWeight.normal,
            ),
            8.horizontalSpace,
          ],
        ),
      ),
    );
  }
}
