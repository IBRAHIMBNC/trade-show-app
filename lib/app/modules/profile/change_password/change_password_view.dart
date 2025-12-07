import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/utils/auth_validators.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/custom_text_field.dart';
import 'package:supplier_snap/app/widgets/my_appbar.dart';
import 'package:supplier_snap/app/widgets/rounded_button/my_rounded_button.dart';

import 'change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Change Password'),
      body: Container(
        padding: EdgeInsets.only(
          top: kPadding12.h,
          right: kPadding24.w,
          left: kPadding24.w,
        ),
        child: Form(
          key: controller.formKey,
          child: Column(
            spacing: kPadding16.h,
            children: [
              CustomText.label14b400(
                'Please enter your current password and new password to change your password.',
                color: KColors.textColor2,
              ),
              CustomTextField(
                hinText: 'Old Password',
                isPassword: true,
                textInputAction: TextInputAction.next,
                onChanged: (value) => controller.oldPassword = value!,
                validator: AuthValidators.validatePassword,
              ),

              CustomTextField(
                hinText: 'New Password',
                validator: AuthValidators.validatePassword,
                textInputAction: TextInputAction.next,
                onChanged: (value) => controller.newPassword = value!,
                isPassword: true,
              ),

              CustomTextField(
                hinText: 'Confirm Password',
                isPassword: true,
                textInputAction: TextInputAction.done,
                onChanged: (value) => controller.confirmPassword = value!,
                validator: controller.validateConfirmPassword,
              ),
              10.verticalSpace,
              RoundedButton('Save'),
            ],
          ),
        ),
      ),
    );
  }
}
