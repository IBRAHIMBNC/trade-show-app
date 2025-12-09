import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/core/extensions/double.dart';
import 'package:supplier_snap/app/utils/auth_validators.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/custom_text_field.dart';
import 'package:supplier_snap/app/widgets/my_appbar.dart';
import 'package:supplier_snap/app/widgets/my_container.dart';
import 'package:supplier_snap/app/widgets/rounded_button/my_rounded_button.dart';

import 'delete_account_controller.dart';

class DeleteAccountView extends GetView<DeleteAccountController> {
  const DeleteAccountView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Delete Account'),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          MyContainer(
            margin: kPadding20.all,
            padding: kPadding16.all,
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                spacing: 16.h,
                children: [
                  CustomText.label16b600('This will permanently delete..'),
                  MyContainer(
                    padding: kPadding12.all,
                    color: KColors.white,
                    child: Column(
                      spacing: 12.h,
                      children: [
                        _buildBulletPoint(
                          text:
                              'Please share your feedback on the issue you encountered with our app, enabling us to improve.',
                        ),
                        _buildBulletPoint(
                          text:
                              'Please share your feedback on the issue you encountered with our app, enabling us to improve.',
                        ),
                        _buildBulletPoint(
                          text:
                              'Please share your feedback on the issue you encountered with our app, enabling us to improve.',
                        ),
                      ],
                    ),
                  ),
                  CustomTextField(
                    hinText: 'Password',
                    isPassword: true,
                    bgColor: KColors.white,
                    onSave: (val) => controller.password = val!.trim(),
                    validator: AuthValidators.validatePassword,
                  ),
                ],
              ),
            ),
          ),
          10.verticalSpace,
          RoundedButton('Continue Deleting', onTap: controller.deleteAccount),
        ],
      ),
    );
  }

  Widget _buildBulletPoint({required String text}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('• '),
        6.horizontalSpace,
        Expanded(
          child: CustomText.label12b400(
            'Please share your feedback on the issue you encountered with our app, enabling us to improve.',
            color: KColors.textColor2,
          ),
        ),
      ],
    );
  }
}
