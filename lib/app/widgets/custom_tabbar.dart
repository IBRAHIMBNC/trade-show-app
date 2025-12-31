import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/core/extensions/double.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';

class CustomTabbar extends StatelessWidget {
  const CustomTabbar({
    super.key,
    required this.tabs,
    this.tabController,
    this.onTabChanged,
    this.isDisabled = false,
    this.bgColor,
  });

  final List<Tab> tabs;
  final TabController? tabController;
  final Function(int index)? onTabChanged;
  final bool isDisabled;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      decoration: ShapeDecoration(
        color: bgColor ?? KColors.white,
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(50.r),
        ),
      ),
      padding: kPadding8.all,
      child: IgnorePointer(
        ignoring: onTabChanged == null,
        child: TabBar(
          labelColor: isDisabled ? KColors.textColor2 : KColors.white,
          labelStyle: AppTextStyles.label14b400.copyWith(color: KColors.white),
          unselectedLabelColor: KColors.black60,
          dividerColor: Colors.transparent,
          padding: EdgeInsets.zero,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: ShapeDecoration(
            shape: RoundedSuperellipseBorder(
              borderRadius: BorderRadius.circular(50.r),
            ),
            color: isDisabled ? Colors.transparent : KColors.black,
          ),
          indicatorColor: Colors.white,
          tabs: tabs,
          controller: tabController,
          onTap: onTabChanged,
        ),
      ),
    );
  }
}
