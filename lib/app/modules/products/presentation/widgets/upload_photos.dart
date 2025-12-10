import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/k_icons.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/core/extensions/double.dart';
import 'package:supplier_snap/app/modules/products/presentation/add_product/add_product_controller.dart';
import 'package:supplier_snap/app/widgets/custom_image.dart';
import 'package:supplier_snap/app/widgets/my_container.dart';
import 'package:supplier_snap/app/widgets/my_list_tile.dart';

class UploadPhotos extends GetView<AddProductController> {
  const UploadPhotos({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.images.isNotEmpty) {
        return Wrap(
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          spacing: kPadding4.w,
          runSpacing: kPadding4.h,
          children: List.generate(controller.images.length + 1, (index) {
            if (index == controller.images.length) {
              return MyContainer(
                onTap: () => controller.pickImages(),
                radius: 12.r,
                height: 95.w,
                width: 95.w,
                padding: kPadding8.all,
                color: KColors.primaryBg,
                child: Icon(Icons.add, color: KColors.black, size: 32.sp),
              );
            }
            final String path = controller.images[index];
            return Padding(
              padding: EdgeInsets.only(right: kPadding8.w, bottom: kPadding8.h),
              child: CustomImage.fromSize(
                path,
                size: 95.w,
                radius: 12.r,
                child: Container(
                  padding: kPadding4.all,
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      controller.images.removeAt(index);
                      controller.update();
                    },
                    child: CircleAvatar(
                      radius: 10.r,
                      backgroundColor: KColors.white,
                      child: Icon(
                        Icons.close,
                        color: KColors.black,
                        size: 16.sp,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        );
      }
      return MyContainer(
        margin: kPadding12.top,
        onTap: () => controller.pickImages(),
        radius: 16.r,
        padding: kPadding16.all,
        color: KColors.white,
        border: BorderSide(color: Colors.grey.shade300, width: 1),
        child: MyListTile(
          horizontalSpacing: 12.w,
          leading: CircleAvatar(
            radius: 20.r,
            backgroundColor: KColors.primaryBg,
            child: CustomImage.icon(KIcons.upload, size: 20.sp),
          ),
          title: 'Upload Photo',
          verticalSpacing: 2.h,
          subtitle: 'Suported formats: JPG, PNG, GIF',
        ),
      );
    });
  }
}
