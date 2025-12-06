import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/k_icons.dart';
import 'package:supplier_snap/app/widgets/my_container.dart';

import 'navigation_controller.dart';

class NavigationView extends GetView<NavigationController> {
  const NavigationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: controller.pages,
      ),
      bottomNavigationBar: Obx(
        () => MyContainer(
          padding: EdgeInsets.all(4.w),
          color: KColors.black,
          radius: 50.r,
          height: 70.h,
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          border: BorderSide(color: KColors.black5, width: 1),
          child: Row(
            children: [
              _buildNavBarItem(imagePath: KIcons.home, index: 0),
              _buildNavBarItem(imagePath: KIcons.ranking, index: 1),
              _buildNavBarItem(imagePath: KIcons.user, index: 2),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _buildNavBarItem({required String imagePath, required int index}) {
    return Expanded(
      child: MyContainer(
        onTap: () {
          controller.onTabChanged(index);
        },
        radius: 50.r,
        // alignment: Alignment.center,
        color: controller.currentIndex.value == index
            ? KColors.brand
            : KColors.white10,
        child: Center(
          child: SvgPicture.asset(
            imagePath,
            width: 20.h,
            height: 20.h,
            fit: BoxFit.contain,
            color: controller.currentIndex.value == index
                ? KColors.black
                : KColors.white,
          ),
        ),
      ),
    );
  }
}
