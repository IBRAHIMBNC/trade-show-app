import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/k_images.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/core/extensions/double.dart';
import 'package:supplier_snap/app/utils/auth_validators.dart';
import 'package:supplier_snap/app/widgets/custom_image.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/custom_text_field.dart';
import 'package:supplier_snap/app/widgets/rounded_button/my_rounded_button.dart';

import 'forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: kPadding24.hp,
        child: Column(
          children: [
            100.verticalSpace,
            CustomImage(
              KImages.blackLogo,
              width: 98.w,
              height: 61.h,
              fit: BoxFit.contain,
            ),
            30.verticalSpace,
            CustomText.label24b800(
              ' Create Your Account',
              fontWeight: FontWeight.w600,
            ),
            kPadding8.verticalSpace,
            CustomText.label14b400(
              'Please provide your registered email address to receive the verification email.',
              color: KColors.black60,
              textAlign: TextAlign.center,
            ),
            21.verticalSpace,
            Form(
              // key: controller.formKey,
              child: CustomTextField(
                controller: controller.emailController,
                validator: AuthValidators.validateEmail,
                hinText: 'Email',
              ),
            ),
            21.verticalSpace,
            RoundedButton('Send Email', onTap: controller.changePassword),
            21.verticalSpace,
            TextButton.icon(
              onPressed: () {
                Get.back();
              },
              label: CustomText.label14b400('Go Back', color: KColors.black),
              icon: Icon(Icons.arrow_back, color: KColors.black, size: 20.sp),
            ),
          ],
        ),
      ),
    );
  }
}
