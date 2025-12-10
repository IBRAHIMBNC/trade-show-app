import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/core/extensions/double.dart';
import 'package:supplier_snap/app/modules/products/presentation/widgets/product_card.dart';
import 'package:supplier_snap/app/widgets/my_appbar.dart';

import 'product_listing_controller.dart';

class ProductListingView extends GetView<ProductListingController> {
  const ProductListingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Products',
        onAddBtnPressed: controller.goToAddProduct,
        addBtnTitle: 'Add Product',
        onSearchChanged: (val) {},
      ),
      body: Obx(
        () => ListView.separated(
          padding: kPadding20.all,
          itemBuilder: (context, index) => ProductCard(
            product: controller.products[index],
            onDeleteTap: () =>
                controller.onProductDelete(controller.products[index].id!),
          ),
          separatorBuilder: (context, index) => 12.verticalSpace,
          itemCount: controller.products.length,
        ),
      ),
    );
  }
}
