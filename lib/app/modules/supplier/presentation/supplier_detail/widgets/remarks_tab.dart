import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/k_icons.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/core/extensions/double.dart';
import 'package:supplier_snap/app/modules/supplier/presentation/supplier_detail/supplier_detail_controller.dart';
import 'package:supplier_snap/app/widgets/custom_image.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/my_container.dart';

class RemarksTab extends GetView<SupplierDetailController> {
  const RemarksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      color: KColors.white,
      padding: kPadding16.all,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (controller.supplier.notes == null ||
              controller.supplier.notes!.trim().isEmpty)
            CustomText.label14b400('No remarks added yet.')
          else
            CustomText.label14b400(controller.supplier.notes!, maxlines: 50),
          12.verticalSpace,
          GestureDetector(
            onTap: controller.onEditSupplierTap,
            child: CustomImage.icon(KIcons.edit, size: 15.sp),
          ),
        ],
      ),
    );
  }
}
