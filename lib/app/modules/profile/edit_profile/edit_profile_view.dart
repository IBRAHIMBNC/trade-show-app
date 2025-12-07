import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/k_icons.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/core/extensions/double.dart';
import 'package:supplier_snap/app/modules/supplier/add_supplier/widgets/add_supplier_info_section.dart';
import 'package:supplier_snap/app/widgets/custom_image.dart';
import 'package:supplier_snap/app/widgets/custom_text_field.dart';
import 'package:supplier_snap/app/widgets/my_appbar.dart';
import 'package:supplier_snap/app/widgets/my_container.dart';
import 'package:supplier_snap/app/widgets/rounded_button/my_rounded_button.dart';

import 'edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Edit Profile'),
      body: Padding(
        padding: kPadding20.all,
        child: Column(
          children: [
            MyContainer(
              color: KColors.white,

              padding: kPadding20.all,
              border: BorderSide(color: KColors.black10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserProfileAvatar(),
                  32.verticalSpace,
                  CustomTextField(
                    hinText: 'Full Name',
                    suffixWidget: Padding(
                      padding: kPadding12.all,
                      child: CustomImage.icon(KIcons.edit2, size: 12.sp),
                    ),
                  ),
                  16.verticalSpace,
                  CustomTextField(hinText: 'Email Address'),
                ],
              ),
            ),
            32.verticalSpace,
            RoundedButton('Save Changes', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
