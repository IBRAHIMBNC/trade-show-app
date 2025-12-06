import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/k_icons.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/core/extensions/double.dart';
import 'package:supplier_snap/app/modules/products/presentation/widgets/product_card.dart';
import 'package:supplier_snap/app/widgets/custom_image.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/custom_text_field.dart';
import 'package:supplier_snap/app/widgets/glowing_border_button.dart';
import 'package:supplier_snap/app/widgets/my_appbar.dart';
import 'package:supplier_snap/app/widgets/my_container.dart';

import 'product_listing_controller.dart';

class ProductListingView extends GetView<ProductListingController> {
  const ProductListingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Products',
        actions: [
          HighlightedEdgeButton(
            onTap: controller.goToAddProduct,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
              child: Row(
                children: [
                  Icon(Icons.add, color: Colors.black, size: 20.sp),
                  5.horizontalSpace,
                  CustomText.label14b400('Add Products'),
                ],
              ),
            ),
          ),
          20.horizontalSpace,
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(75.h),
          child: _buildSearchBar(),
        ),
      ),
      body: ListView.separated(
        padding: kPadding20.all,
        itemBuilder: (context, index) => ProductCard(),
        separatorBuilder: (context, index) => 12.verticalSpace,
        itemCount: 10,
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 20.w, vertical: 10.h),
      child: CustomTextField(
        borderRadius: 50.r,
        hinText: 'Search',
        suffixWidget: MyContainer(
          height: 40.h,
          width: 52.w,
          margin: EdgeInsets.only(right: 8.w),
          radius: 50.r,
          color: KColors.white,
          alignment: Alignment.center,
          child: CustomImage(KIcons.search, width: 20.h, height: 20.h),
        ),
      ),
    );
  }
}
