import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/k_icons.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/core/extensions/double.dart';
import 'package:supplier_snap/app/routes/app_pages.dart';
import 'package:supplier_snap/app/widgets/custom_image.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/rounded_button/my_rounded_button.dart';

class StartCompareScreen extends StatelessWidget {
  const StartCompareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: kPadding44.all,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40.r,
                        backgroundColor: KColors.successColor.withValues(
                          alpha: 0.1,
                        ),
                      ),
                      4.horizontalSpace,
                      CircleAvatar(
                        radius: 40.r,
                        backgroundColor: KColors.successColor.withValues(
                          alpha: 0.1,
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 24.r,
                    backgroundColor: KColors.white,
                    child: CircleAvatar(
                      backgroundColor: KColors.primaryBg,
                      radius: 22.r,
                      child: CustomImage.icon(KIcons.startCompare, size: 20.sp),
                    ),
                  ),
                ],
              ),
              22.verticalSpace,
              CustomText.label20b800(
                'Compare Suppliers',
                fontWeight: FontWeight.bold,
              ),
              8.verticalSpace,
              CustomText.label14b400(
                'Select suppliers to score and evaluate side by side.',
                textAlign: TextAlign.center,
                maxlines: 2,
                color: KColors.black40,
              ),

              32.verticalSpace,

              RoundedButton(
                'Start Comparison',
                onTap: () {
                  Get.toNamed(Routes.COMPARISON);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
