import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/custom_text_field.dart';
import 'package:supplier_snap/app/widgets/my_container.dart';

class ScoringSection extends StatelessWidget {
  const ScoringSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.label24b800('Scoring', fontWeight: FontWeight.w600),
          16.verticalSpace,
          MyContainer(width: double.infinity, height: 300.h),
          32.verticalSpace,
          CustomText.label24b800('Remarks', fontWeight: FontWeight.w600),
          16.verticalSpace,
          CustomTextField(hinText: 'Write your remarks here...', lines: 6),
        ],
      ),
    );
  }
}
