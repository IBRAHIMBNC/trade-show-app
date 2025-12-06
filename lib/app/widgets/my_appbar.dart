import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/my_back_button.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final dynamic title;
  final bool showBackButton;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? iconColor;
  final VoidCallback? onBackPressed;
  final double? height;
  final double? titleSpacing;
  final PreferredSizeWidget? bottom; // Added bottom property
  final Widget? leading;

  const MyAppBar({
    super.key,
    this.title,
    this.showBackButton = true,
    this.actions,
    this.backgroundColor,
    this.iconColor = Colors.black,
    this.onBackPressed,
    this.height = 70,
    this.titleSpacing,
    this.bottom,
    this.leading, // Initialize bottom
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: height ?? kToolbarHeight,
      backgroundColor: backgroundColor ?? Colors.white,
      scrolledUnderElevation: 8,
      shadowColor: KColors.black20,
      centerTitle: false,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          12.horizontalSpace,
          if (leading != null)
            leading!
          else
            showBackButton && Navigator.canPop(context)
                ? InkWell(
                    onTap: onBackPressed ?? () => Navigator.of(context).pop(),
                    child: MyBackButton(iconColor: iconColor),
                  )
                : SizedBox.shrink(),
          (titleSpacing ?? 16.w).horizontalSpace,
          (title != null && title is String
              ? CustomText.label18b600(title!, fontWeight: FontWeight.w600)
              : title is Widget
              ? title
              : SizedBox.shrink()),
        ],
      ),
      titleSpacing: 8.w,
      actions: actions,
      bottom: bottom, // Added bottom to AppBar
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
    (height ?? kToolbarHeight + 10) +
        (bottom?.preferredSize.height ?? 0), // Adjust height for bottom
  );
}
