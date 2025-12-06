import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/k_icons.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/core/extensions/double.dart';
import 'package:supplier_snap/app/widgets/custom_image.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/my_container.dart';

class InfoTab extends StatelessWidget {
  const InfoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      width: double.infinity,
      padding: kPadding16.all,
      color: KColors.white,
      child: Column(
        spacing: 16.h,
        children: [
          _buildInfoRow('Booth', 'B12'),
          _buildInfoRow('Phone', '+92 346 1599161'),
          _buildInfoRow('Email', 'ibrahim@gmail.com'),
          _buildInfoRow('Company', 'ABC Traders'),
          _buildInfoRow('Industry', 'B12'),
          _buildInfoRow('Interest level', 'High'),
          _buildInfoRow('Product Type', 'Electronics', isLast: true),
        ],
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
