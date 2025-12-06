import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/k_icons.dart';
import 'package:supplier_snap/app/widgets/custom_image.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/rounded_button/my_rounded_button.dart';

class WeChatAndWhatsappBtns extends StatelessWidget {
  const WeChatAndWhatsappBtns({
    super.key,
    this.onWeChatTap,
    this.onWhatsAppTap,
    this.bgColor,
  });

  final Function? onWeChatTap;
  final Function? onWhatsAppTap;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: Row(
        spacing: 8.w,
        children: [
          Expanded(
            child: RoundedButton(
              Row(
                children: [
                  CustomImage.icon(KIcons.weChat, size: 20.w),
                  8.horizontalSpace,
                  CustomText.label14b400('WeChat', color: KColors.black),
                ],
              ),
              backgroundColor: bgColor ?? KColors.white,
            ),
          ),
          Expanded(
            child: RoundedButton(
              Row(
                children: [
                  CustomImage.icon(KIcons.whatsApp, size: 20.w),
                  8.horizontalSpace,
                  CustomText.label14b400('Whatsapp', color: KColors.black),
                ],
              ),
              backgroundColor: bgColor ?? KColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
