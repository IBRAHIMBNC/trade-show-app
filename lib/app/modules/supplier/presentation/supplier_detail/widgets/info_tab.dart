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

class InfoTab extends GetView<SupplierDetailController> {
  const InfoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return _buidSupplierInfo();
  }

  _buidSupplierInfo() {
    final detailItems = <Map<String, String>>[];

    if (controller.supplier.booth.isNotEmpty) {
      detailItems.add({'title': 'Booth', 'value': controller.supplier.booth});
    }

    if (controller.supplier.phone?.isNotEmpty == true) {
      detailItems.add({'title': 'Phone', 'value': controller.supplier.phone!});
    }

    if (controller.supplier.email?.isNotEmpty == true) {
      detailItems.add({'title': 'Email', 'value': controller.supplier.email!});
    }

    if (controller.supplier.company.isNotEmpty) {
      detailItems.add({
        'title': 'Company',
        'value': controller.supplier.company,
      });
    }

    if (controller.supplier.industry?.isNotEmpty == true) {
      detailItems.add({
        'title': 'Industry',
        'value': controller.supplier.industry!,
      });
    }

    if (controller.supplier.interestLevel?.isNotEmpty == true) {
      detailItems.add({
        'title': 'Interest level',
        'value': controller.supplier.interestLevel!,
      });
    }

    return MyContainer(
      width: double.infinity,
      padding: kPadding16.all,
      color: KColors.white,
      child: Column(
        children: [
          ...detailItems.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            final isLast = index == detailItems.length - 1;

            return _buildInfoRow(
              item['title']!,
              item['value']!,
              isLast: isLast,
            );
          }),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String title, String? value, {bool isLast = false}) {
    if (value == null || value.isEmpty) {
      return SizedBox.shrink();
    }
    return Column(
      children: [
        Row(
          children: [
            CustomText.label14b400(title, color: KColors.black60),
            Spacer(),
            CustomText.label14b600(value, fontWeight: FontWeight.w500),
            10.horizontalSpace,
            GestureDetector(
              onTap: controller.onEditSupplierTap,
              child: CustomImage.icon(KIcons.edit, size: 20),
            ),
          ],
        ),
        if (!isLast) ...[
          Divider(thickness: 1, color: KColors.black5, height: 8.h),
          16.verticalSpace,
        ],
      ],
    );
  }
}
