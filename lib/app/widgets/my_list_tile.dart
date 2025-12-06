import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/my_container.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({
    super.key,
    required this.title,
    this.onTap,
    this.leading,
    this.trailing,
    this.subtitle,
    this.padding,
    this.color,
    this.isDense = false,
    this.radius,
    this.horizontalSpacing,
    this.crossAxisAlignment,
    this.border,
    this.verticalSpacing,
  });

  final Object title;
  final Function()? onTap;
  final Widget? leading;
  final Widget? trailing;
  final Object? subtitle;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final bool isDense;
  final CrossAxisAlignment? crossAxisAlignment;
  final double? radius;
  final BorderSide? border;
  final double? horizontalSpacing;
  final double? verticalSpacing;

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      onTap: onTap,
      padding: padding,
      color: color ?? Colors.transparent,
      radius: radius ?? 20.r,
      border: border ?? BorderSide.none,
      child: Row(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leading != null) ...[
            leading!,
            if (horizontalSpacing == null)
              kPadding16.horizontalSpace
            else
              horizontalSpacing!.horizontalSpace,
          ],
          Expanded(
            flex: isDense ? 0 : 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title is Widget) ...[
                  title as Widget,
                ] else if (title is String)
                  CustomText.label14b600(title as String)
                else
                  Container(),
                ?(verticalSpacing?.verticalSpace),
                if (subtitle is Widget) ...[
                  subtitle as Widget,
                ] else if (subtitle is String)
                  CustomText.label12b400(
                    subtitle as String,
                    color: KColors.black60,
                    textAlign: TextAlign.left,
                  )
                else
                  Container(),
              ],
            ),
          ),
          if (trailing != null) ...[trailing!],
        ],
      ),
    );
  }
}
