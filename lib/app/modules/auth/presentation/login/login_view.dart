import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/k_images.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/core/extensions/double.dart';
import 'package:supplier_snap/app/routes/app_pages.dart';
import 'package:supplier_snap/app/utils/auth_validators.dart';
import 'package:supplier_snap/app/widgets/custom_image.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/custom_text_field.dart';
import 'package:supplier_snap/app/widgets/rounded_button/my_rounded_button.dart';

import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding: kPadding20.hp,
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImage(
                  KImages.blackLogo,
                  width: 98.w,
                  height: 61.h,
                  fit: BoxFit.contain,
                ),
                30.verticalSpace,
                CustomText.label24b800(
                  'Welcome Back!',
                  fontWeight: FontWeight.w600,
                ),
                4.verticalSpace,
                CustomText.label14b400(
                  'Sign in to continue',
                  color: KColors.black40,
                ),
                35.verticalSpace,
                CustomTextField(
                  hinText: 'Email',
                  readOnly: controller.isLoading.value,
                  validator: AuthValidators.validateEmail,
                  onSave: (value) {
                    controller.email = value!.trim();
                  },
                ),
                21.verticalSpace,
                CustomTextField(
                  readOnly: controller.isLoading.value,
                  hinText: 'Password',
                  isPassword: true,
                  validator: AuthValidators.validatePassword,
                  onSave: (value) {
                    controller.password = value!;
                  },
                ),
                8.verticalSpace,
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Get.toNamed(Routes.FORGOT_PASSWORD);
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: CustomText.label12b400(
                      'Forgot Password?',
                      color: KColors.black,
                    ),
                  ),
                ),
                35.verticalSpace,
                RoundedButton(
                  'Sign In ',
                  isLoading: controller.isLoading.value,
                  onTap: controller.signIn,
                ),
                35.verticalSpace,
                Row(
                  children: [
                    50.horizontalSpace,
                    Expanded(child: Divider(color: KColors.grey)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: CustomText.label14b400('Or'),
                    ),
                    Expanded(child: Divider(color: KColors.grey)),
                    50.horizontalSpace,
                  ],
                ),
                35.verticalSpace,
                RoundedButton(
                  Row(
                    children: [
                      CustomImage(
                        KImages.googleLogo,
                        height: 20.h,
                        width: 20.w,
                      ),
                      kPadding8.horizontalSpace,
                      CustomText.label16b600(
                        'Sign In with Google',
                        fontWeight: FontWeight.normal,
                      ),
                    ],
                  ),
                  onTap: () {},
                  isDisabled: controller.isLoading.value,
                  borderSide: BorderSide(color: KColors.black10),
                  backgroundColor: Colors.transparent,
                  fontColor: KColors.black,
                ),
                30.verticalSpace,
                CustomText.label14b400(
                  'Don\'t have an account?',
                  color: KColors.black60,
                ),
                4.verticalSpace,
                InkWell(
                  onTap: () {
                    if (controller.isLoading.value) return;
                    Get.offNamed(Routes.SIGN_UP);
                  },
                  child: CustomText.label14b600(
                    'Sign Up',
                    color: KColors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
