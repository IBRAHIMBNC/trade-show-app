import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/k_icons.dart';
import 'package:supplier_snap/app/widgets/custom_image.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/custom_text_field.dart';
import 'package:supplier_snap/app/widgets/glowing_border_button.dart';
import 'package:supplier_snap/app/widgets/my_back_button.dart';
import 'package:supplier_snap/app/widgets/my_container.dart';

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
  final String? actionBtnTitle;
  final String? actionBtnIcon;
  final Function()? onActionBtnPressed;
  final Function(String? val)? onSearchChanged;

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
    this.leading,
    this.actionBtnTitle,
    this.onActionBtnPressed,
    this.onSearchChanged,
    this.actionBtnIcon,
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
      actions: [
        ...?actions,
        if (actionBtnTitle != null && onActionBtnPressed != null)
          HighlightedEdgeButton(
            onTap: onActionBtnPressed,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
              child: Row(
                children: [
                  if (actionBtnIcon != null)
                    CustomImage.icon(actionBtnIcon!, size: 15.sp)
                  else
                    Icon(Icons.add, color: Colors.black, size: 20.sp),
                  5.horizontalSpace,
                  CustomText.label14b400(actionBtnTitle!),
                ],
              ),
            ),
          ),
        20.horizontalSpace,
      ],
      bottom: _buildBottom(), // Added bottom to AppBar
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
    (height ?? kToolbarHeight + 10) +
        (bottom?.preferredSize.height ??
            _buildBottom()?.preferredSize.height ??
            0),
  );

  PreferredSizeWidget? _buildBottom() {
    return bottom ??
        (onSearchChanged == null
            ? null
            : PreferredSize(
                preferredSize: Size.fromHeight(75.h),
                child: _buildSearchBar(),
              ));
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 20.w, vertical: 10.h),
      child: CustomTextField(
        borderRadius: 50.r,
        hinText: 'Search',
        suffixWidget: MyContainer(
          height: 40.h,
          width: 52.w,
          margin: EdgeInsets.only(right: 8.w),
          radius: 50.r,
          color: KColors.white,
          alignment: Alignment.center,
          child: CustomImage(KIcons.search, width: 20.h, height: 20.h),
        ),
      ),
    );
  }
}
