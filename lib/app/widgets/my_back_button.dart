import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/widgets/my_container.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key, this.iconColor, this.height, this.width});

  final Color? iconColor;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      onTap: () {
        Navigator.of(context).pop();
      },
      height: height?.h ?? 40.h,
      width: width?.w ?? 32.w,
      color: KColors.primaryBg,
      radius: BorderRadius.only(
        topLeft: Radius.circular(50.r),
        bottomLeft: Radius.circular(50.r),
        topRight: Radius.circular(12.r),
        bottomRight: Radius.circular(12.r),
      ),
      child: Icon(
        Icons.arrow_back_ios_new,
        color: iconColor ?? KColors.black,
        size: 13.r,
      ),
    );
  }
}
