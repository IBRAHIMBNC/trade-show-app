import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/k_images.dart';
import 'package:supplier_snap/app/widgets/custom_image.dart';

import 'splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<SplashScreenController>();
    return Scaffold(
      body: Center(
        child: CustomImage(
          KImages.blackLogo,
          width: 115.w,
          height: 75.h,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
