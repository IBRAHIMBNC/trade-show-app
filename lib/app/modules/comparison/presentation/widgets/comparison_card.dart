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

class ComparisonCard extends StatelessWidget {
  const ComparisonCard({super.key, required this.supplier, this.index = 0});

  final SupplierModel supplier;
  final int index;

  bool get isTopSeller {
    return index < 3;
  }

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      radius: BorderRadius.vertical(
        top: Radius.circular(44.r),
        bottom: Radius.circular(16.r),
      ),
      gradient: gradient,
      color: isTopSeller ? null : KColors.white,
      border: isTopSeller ? null : BorderSide(color: KColors.black10, width: 1),
      width: double.infinity,
      child: Column(
        children: [
          _buildHeader(),
          Theme(
            data: ThemeData().copyWith(dividerColor: Colors.transparent),
            child: MyContainer(
              color: isTopSeller ? KColors.white40 : KColors.primaryBg,
              radius: BorderRadius.vertical(bottom: Radius.circular(16.r)),
              child: ExpansionTile(
                tilePadding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 4.h,
                ),
                title: CustomText.label14b600(
                  'View Scoring',
                  fontWeight: FontWeight.normal,
                  color: KColors.black60,
                ),
                childrenPadding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 8.h,
                ),
                children: [
                  Column(
                    spacing: 16.h,
                    children: [
                      _buildTitleValue('Cost', supplier.scores.cost.toString()),
                      _buildTitleValue(
                        'Quality',
                        supplier.scores.quality.toString(),
                      ),
                      _buildTitleValue(
                        'Lead Time',
                        supplier.scores.leadTime.toString(),
                      ),
                      _buildTitleValue(
                        'Certifications',
                        supplier.scores.certifications.toString(),
                      ),
                      _buildTitleValue(
                        'Fit',
                        supplier.scores.fit.toString(),
                        true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleValue(String title, String value, [bool isLast = false]) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText.label16b600(
              title,
              color: KColors.textColor2,
              fontWeight: FontWeight.normal,
            ),
            Spacer(),
            CustomText.label14b400(value, fontWeight: FontWeight.w600),
          ],
        ),
        if (!isLast)
          Divider(color: KColors.black10, height: 16.h)
        else
          16.verticalSpace,
      ],
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 16),
      child: Row(
        children: [
          12.horizontalSpace,
          CustomText.label20b800('${index + 1}', fontWeight: FontWeight.w600),
          12.horizontalSpace,
          Expanded(
            child: MyListTile(
              color: isTopSeller
                  ? Color(0xff3BFF00).withValues(alpha: 0.05)
                  : KColors.primaryBg,
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
                          (supplier.absoluteImagePath ?? supplier.imageUrl) !=
                          null,
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
                color: isTopSeller ? KColors.white20 : KColors.white,
                border: BorderSide(color: KColors.white, width: 1),
                margin: EdgeInsets.only(left: 4.w),
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
                radius: 30.r,
                child: Row(
                  children: [
                    MyContainer(
                      radius: 30.r,
                      padding: EdgeInsets.symmetric(
                        vertical: 8.h,
                        horizontal: 12.w,
                      ),
                      color: badgeColor,
                      child: CustomImage.icon(
                        KIcons.ranking,
                        size: 16.w,
                        color: isTopSeller ? KColors.white : KColors.black,
                      ),
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
              // MyContainer(
              //   padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
              //   color: isTopSeller ? KColors.white20 : KColors.white,
              //   border: BorderSide(color: KColors.white, width: 1),
              //   radius: 30.r,
              //   child: Row(
              //     children: [
              //       MyContainer(
              //         radius: 30.r,
              //         padding: EdgeInsets.symmetric(
              //           vertical: 8.h,
              //           horizontal: 12.w,
              //         ),
              //         color: badgeColor,
              //         child: CustomImage.icon(
              //           KIcons.ranking,
              //           size: 22.w,
              //           color: isTopSeller ? KColors.white : KColors.black,
              //         ),
              //       ),
              //       8.horizontalSpace,
              //       CustomText.label16b600('8', fontWeight: FontWeight.normal),
              //       8.horizontalSpace,
              //     ],
              //   ),
              // ),
            ),
          ),
        ],
      ),
    );
  }

  Gradient? get gradient {
    switch (index) {
      case 0:
        return KGradients.first;
      case 1:
        return KGradients.second;
      case 2:
        return KGradients.third;
      default:
        return null;
    }
  }

  Color get badgeColor {
    switch (index) {
      case 0:
        return KColors.firstBadge;
      case 1:
        return KColors.secondBadge;
      case 2:
        return KColors.thirdBadge;
      default:
        return KColors.primaryBg;
    }
  }
}
