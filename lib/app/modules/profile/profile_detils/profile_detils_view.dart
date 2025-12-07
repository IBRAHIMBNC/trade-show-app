import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/k_icons.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/core/extensions/double.dart';
import 'package:supplier_snap/app/widgets/custom_image.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/my_container.dart';
import 'package:supplier_snap/app/widgets/my_list_tile.dart';

import 'profile_detils_controller.dart';

class ProfileDetilsView extends GetView<ProfileDetilsController> {
  const ProfileDetilsView({super.key});
  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.paddingOf(context).top;
    return Scaffold(
      body: Padding(
        padding: kPadding20.hp,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topPadding.verticalSpace,
            MyListTile(
              border: BorderSide(color: KColors.black10),
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
              radius: 50.r,
              horizontalSpacing: 8.w,
              leading: CircleAvatar(
                radius: 25.r,
                backgroundColor: KColors.primaryBg,
                child: CustomImage.icon(
                  KIcons.user,
                  size: 18.sp,
                  color: KColors.black,
                ),
              ),
              title: CustomText.label14b600('Jms Oldeio'),
              verticalSpacing: 4.h,
              subtitle: CustomText.label12b400(
                'jmsoldeio456@gmail.com',
                color: KColors.black60,
              ),
              trailing: CircleAvatar(
                radius: 26.r,
                backgroundColor: KColors.primaryBg,
                child: CustomImage.icon(
                  KIcons.logout,
                  size: 25.sp,
                  color: KColors.black,
                ),
              ),
            ),
            24.verticalSpace,
            _buildEditProfile(
              iconPath: KIcons.user,
              title: 'Edit Profile',
              onTap: controller.goToEditPofile,
            ),
            12.verticalSpace,
            _buildEditProfile(
              iconPath: KIcons.lock,
              title: 'Change Password',
              onTap: controller.goToChangePassword,
            ),
            12.verticalSpace,
            _buildEditProfile(
              iconPath: KIcons.delete,
              title: 'Delete Account',
              onTap: controller.goToDeleteAccount,
            ),
            24.verticalSpace,
            CustomText.label14b400(
              'Expo Sync',
              color: KColors.black,
              fontWeight: FontWeight.w300,
            ),
            12.verticalSpace,
            MyContainer(
              width: double.infinity,
              radius: 12.r,
              padding: kPadding16.all,
              color: Colors.transparent,
              border: BorderSide(color: KColors.black5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText.label14b400(
                    'About Us',
                    color: KColors.black,
                    fontWeight: FontWeight.w300,
                  ),
                  Divider(color: KColors.black5, height: 24.h),
                  CustomText.label14b400(
                    'FAQs',
                    color: KColors.black,
                    fontWeight: FontWeight.w300,
                  ),
                  Divider(color: KColors.black5, height: 24.h),
                  CustomText.label14b400(
                    'Terms & Conditions',
                    color: KColors.black,
                    fontWeight: FontWeight.w300,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  MyListTile _buildEditProfile({
    required String iconPath,
    required String title,
    Function()? onTap,
  }) {
    return MyListTile(
      onTap: onTap,
      color: KColors.primaryBg,
      padding: kPadding8.all,
      radius: 8.r,
      horizontalSpacing: 12.w,
      leading: MyContainer(
        width: 33.h,
        height: 33.h,
        radius: 6.r,
        color: KColors.white,
        alignment: Alignment.center,
        child: CustomImage.icon(iconPath, size: 16.sp, color: KColors.black),
      ),
      title: CustomText.label14b400(title, fontWeight: FontWeight.w300),
    );
  }
}
