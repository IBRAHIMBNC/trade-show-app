import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/k_icons.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/core/extensions/double.dart';
import 'package:supplier_snap/app/widgets/custom_image.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/my_container.dart';

class RemarksTab extends StatelessWidget {
  const RemarksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      color: KColors.white,
      padding: kPadding16.all,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.label14b400(
            'Met at booth B12 — interested in bulk orders and open to price negotiation. Follow up next week with updated pricing and MOQ details.',
          ),
          12.verticalSpace,
          CustomImage.icon(KIcons.edit, size: 15.sp),
        ],
      ),
    );
  }
}
