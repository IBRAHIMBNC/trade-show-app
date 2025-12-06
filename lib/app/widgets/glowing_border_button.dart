import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/widgets/rounded_button/my_rounded_button.dart';

class HighlightedEdgeButton extends StatelessWidget {
  const HighlightedEdgeButton({super.key, required this.child, this.onTap});
  final Widget child;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      child,
      isDense: true,
      backgroundColor: KColors.white,
      onTap: onTap,
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 0.h),
      borderSide: BorderSide(color: KColors.brand, width: 1.5),
    );
  }
}
