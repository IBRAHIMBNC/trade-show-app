import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/k_icons.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/core/extensions/double.dart';
import 'package:supplier_snap/app/modules/supplier/data/models/supplier_model.dart';
import 'package:supplier_snap/app/routes/app_pages.dart';
import 'package:supplier_snap/app/widgets/custom_image.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/my_container.dart';
import 'package:supplier_snap/app/widgets/my_list_tile.dart';
import 'package:supplier_snap/app/widgets/my_pop_up.dart';
import 'package:supplier_snap/app/widgets/we_chat_whatsapp_btn.dart';

class SupplierDetailsCard extends StatelessWidget {
  const SupplierDetailsCard({
    super.key,
    required this.supplier,
    this.onEditTap,
    this.onDeleteTap,
  });

  final SupplierModel supplier;

  final Function()? onEditTap;
  final Function()? onDeleteTap;

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      onTap: () {
        Get.toNamed(Routes.SUPPLIER_DETAIL, arguments: supplier.id);
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
              child: CustomImage.cirlce(
                supplier.imageLocalPath ?? '',
                size: 60.w,
                hideChild: supplier.imageLocalPath != null,
                backgroundColor: KColors.white,
                child: CustomImage.icon(
                  KIcons.user,
                  size: 22.sp,
                  color: KColors.black,
                ),
              ),
            ),
            title: IntrinsicHeight(
              child: Row(
                children: [
                  CustomText.label16b600(supplier.name, autoSized: false),
                  8.horizontalSpace,
                  VerticalDivider(
                    color: KColors.black40,
                    thickness: 1,
                    width: 8.w,
                    indent: 4.h,
                    endIndent: 4.h,
                  ),
                  8.horizontalSpace,
                  CustomImage.icon(KIcons.ranking, size: 15.w),
                  CustomText.label14b600(
                    ' ${supplier.score ?? '8'}',
                    color: KColors.black60,
                    autoSized: false,
                  ),
                ],
              ),
            ),
            verticalSpacing: 4.h,
            subtitle: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 8.w,
                children: [
                  if (supplier.interestLevel != null)
                    MyContainer(
                      color: KColors.white,
                      padding: EdgeInsets.symmetric(
                        vertical: 4.h,
                        horizontal: 12.w,
                      ),
                      child: CustomText.label10b400(
                        supplier.industry!,
                        color: KColors.black60,
                      ),
                    ),
                  if (supplier.industry != null)
                    MyContainer(
                      color: KColors.white,
                      padding: EdgeInsets.symmetric(
                        vertical: 4.h,
                        horizontal: 12.w,
                      ),
                      child: CustomText.label10b400(
                        supplier.industry!,
                        color: KColors.black60,
                      ),
                    ),
                ],
              ),
            ),
            trailing: MyPopupMenu(
              items: ['Edit', 'Delete'],
              onSelected: (value) {
                if (value == 'Edit') {
                  onEditTap?.call();
                } else if (value == 'Delete') {
                  onDeleteTap?.call();
                }
              },
            ),
            // trailing: MyContainer(
            //   padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
            //   color: KColors.white,
            //   radius: 30.r,
            //   child: Row(
            //     children: [
            //       MyContainer(
            //         radius: 30.r,
            //         padding: EdgeInsets.symmetric(
            //           vertical: 8.h,
            //           horizontal: 12.w,
            //         ),
            //         color: KColors.primaryBg,
            //         child: CustomImage.icon(KIcons.ranking, size: 22.w),
            //       ),
            //       8.horizontalSpace,
            //       CustomText.label16b600('8', fontWeight: FontWeight.normal),
            //       8.horizontalSpace,
            //     ],
            //   ),
            // ),
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
