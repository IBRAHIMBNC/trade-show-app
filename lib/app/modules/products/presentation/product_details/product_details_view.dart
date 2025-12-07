import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/k_icons.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/core/extensions/double.dart';
import 'package:supplier_snap/app/modules/products/presentation/widgets/product_image_carousel.dart';
import 'package:supplier_snap/app/widgets/custom_image.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/my_appbar.dart';
import 'package:supplier_snap/app/widgets/my_container.dart';
import 'package:supplier_snap/app/widgets/my_list_tile.dart';

import 'product_details_controller.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Product Details'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            10.verticalSpace,
            ImageCarousel(),
            Padding(
              padding: kPadding16.all,
              child: Column(
                children: [
                  MyListTile(
                    title: CustomText.label24b800(
                      '\$15',
                      fontWeight: FontWeight.bold,
                    ),
                    subtitle: CustomText.label16b600(
                      'Aschaltic Cement',
                      fontWeight: FontWeight.w500,
                    ),
                    trailing: Row(
                      children: [
                        MyContainer(
                          radius: 50.r,
                          height: 40.h,
                          width: 40.w,
                          alignment: Alignment.center,
                          child: CustomImage.icon(KIcons.edit, size: 18.sp),
                        ),
                        6.horizontalSpace,
                        MyContainer(
                          radius: 50.r,
                          height: 40.h,
                          width: 40.w,
                          alignment: Alignment.center,
                          child: Icon(Icons.share_outlined, size: 18.sp),
                        ),
                      ],
                    ),
                  ),
                  16.verticalSpace,
                  MyContainer(
                    color: KColors.white,
                    padding: kPadding16.all,
                    border: BorderSide(color: KColors.black5),
                    child: Column(
                      spacing: 16.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText.label18b600('Details'),
                        _buildInfoRow('Category', 'Cement'),
                        _buildInfoRow('MOQ', '1000 tons'),
                        _buildInfoRow('Lead Time', '18 days'),
                        _buildInfoRow(
                          'Certifications',
                          'ISO 9001, ASTM',
                          isLast: true,
                        ),
                      ],
                    ),
                  ),
                  16.verticalSpace,
                  MyContainer(
                    color: KColors.white,
                    padding: kPadding16.all,
                    border: BorderSide(color: KColors.black5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText.label16b600('Specifications'),
                        8.verticalSpace,
                        CustomText.label14b400(
                          'Aschaltic cement is a type of cement that is commonly used in construction projects. It is known for its durability and strength, making it ideal for building structures that require long-lasting performance.',
                          color: KColors.black40,
                        ),
                      ],
                    ),
                  ),
                  16.verticalSpace,
                  MyContainer(
                    color: KColors.white,
                    padding: kPadding16.all,
                    border: BorderSide(color: KColors.black5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText.label16b600('Notes / Internal Comment'),
                        8.verticalSpace,
                        CustomText.label14b400(
                          "With its sleek and captivating design, the Electronic Egg Toy immediately captures attention. Crafted with vibrant colors and smooth contours, it's visually appealing.",
                          color: KColors.black40,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value, {bool isLast = false}) {
    return Column(
      children: [
        Row(
          children: [
            CustomText.label14b400(title, color: KColors.black60),
            Spacer(),
            CustomText.label14b600(value, fontWeight: FontWeight.w500),
            10.horizontalSpace,
            CustomImage.icon(KIcons.edit, size: 20),
          ],
        ),
        if (!isLast) ...[
          Divider(thickness: 1, color: KColors.black5, height: 8.h),
        ],
      ],
    );
  }
}
