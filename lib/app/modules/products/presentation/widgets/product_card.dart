import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/core/extensions/double.dart';
import 'package:supplier_snap/app/modules/products/data/models/product_model.dart';
import 'package:supplier_snap/app/modules/products/presentation/add_product/add_product_controller.dart';
import 'package:supplier_snap/app/routes/app_pages.dart';
import 'package:supplier_snap/app/widgets/custom_image.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/my_list_tile.dart';
import 'package:supplier_snap/app/widgets/my_pop_up.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
    this.onDeleteTap,
  });

  final ProductModel product;
  final Function()? onTap;
  final Function()? onDeleteTap;

  @override
  Widget build(BuildContext context) {
    return MyListTile(
      onTap:
          onTap ??
          () => Get.toNamed(Routes.PRODUCT_DETAILS, arguments: product),
      padding: kPadding16.all,
      border: BorderSide(color: KColors.black5),
      leading: CustomImage.fromSize(
        product.absoluteImagePaths.first,
        size: 75.h,
        radius: 15.r,
      ),
      title: Row(
        children: [
          CustomText.label14b600('\$${product.price}'),
          8.horizontalSpace,
          CustomText.label12b400(
            '(${product.moq} ${product.moqUnit})',
            color: KColors.black60,
          ),
          Spacer(),
          MyPopupMenu(
            items: ['Edit', 'Delete'],
            onSelected: (value) {
              if (value == 'Edit') {
                Get.toNamed(
                  Routes.ADD_PRODUCT,
                  arguments: AddProductViewArgs(product: product),
                );
              } else if (value == 'Delete') {
                if (onDeleteTap != null) {
                  onDeleteTap!();
                }
              }
            },
          ),
        ],
      ),
      verticalSpacing: 4.h,
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.label16b600(product.name),
          4.verticalSpace,
          CustomText.label12b400(
            product.category.displayName,
            color: KColors.black60,
          ),
        ],
      ),
    );
  }
}
