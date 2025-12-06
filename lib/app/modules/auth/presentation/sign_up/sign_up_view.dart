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

import 'sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Obx(
        () => Form(
          key: controller.formKey,
          child: Padding(
            padding: kPadding20.hp,
            child: Column(
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
                  ' Create Your Account',
                  fontWeight: FontWeight.w600,
                ),
                4.verticalSpace,
                CustomText.label14b400(
                  'Start capturing suppliers, products, and files.',
                  color: KColors.black40,
                ),
                21.verticalSpace,
                CustomTextField(
                  readOnly: controller.isLoading.value,
                  hinText: 'Full Name',
                  validator: (val) =>
                      AuthValidators.requiredField(val, 'Full Name'),
                  onSave: (value) {
                    controller.name = value!.trim();
                  },
                ),

                21.verticalSpace,
                CustomTextField(
                  readOnly: controller.isLoading.value,
                  hinText: 'Email',
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
                21.verticalSpace,
                RoundedButton(
                  'SignUp',
                  onTap: controller.signUp,
                  isLoading: controller.isLoading.value,
                ),
                21.verticalSpace,
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
                21.verticalSpace,
                RoundedButton(
                  Row(
                    children: [
                      Image.asset(
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
                  isDisabled: controller.isLoading.value,
                  onTap: () {},
                  borderSide: BorderSide(color: KColors.black10),
                  backgroundColor: Colors.transparent,
                  fontColor: KColors.black,
                ),
                21.verticalSpace,
                CustomText.label14b400(
                  'Already have an account?',
                  color: KColors.black60,
                ),
                4.verticalSpace,
                InkWell(
                  onTap: controller.isLoading.value
                      ? null
                      : () {
                          Get.offNamed(Routes.LOGIN);
                        },
                  child: CustomText.label14b600('Log In', color: KColors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
