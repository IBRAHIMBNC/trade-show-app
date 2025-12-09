import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/k_icons.dart';
import 'package:supplier_snap/app/widgets/custom_image.dart';
import 'package:supplier_snap/app/widgets/my_container.dart';

class UserProfileAvatar extends StatelessWidget {
  const UserProfileAvatar({
    super.key,
    this.imageUrl,
    this.onTap,
    this.imageFile,
  });

  final String? imageUrl;
  final String? imageFile;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      onTap: onTap,
      color: Colors.transparent,
      height: 100.h,
      width: 100.w,
      child: Stack(
        children: [
          if (imageUrl != null || imageFile != null)
            CustomImage.cirlce(
              imageFile ?? imageUrl!,
              radius: 50.r,
              size: 100.sp,
            )
          else
            CircleAvatar(
              radius: 50.r,
              backgroundColor: KColors.primaryBg,
              child: CustomImage.icon(
                KIcons.user,
                size: 29.sp,
                color: KColors.black,
              ),
            ),
          Positioned(
            bottom: 5,
            right: 5,
            child: CircleAvatar(
              radius: 12.r,
              backgroundColor: KColors.black,
              child: Icon(Icons.camera_alt, color: KColors.white, size: 15.r),
            ),
          ),
        ],
      ),
    );
  }
}
