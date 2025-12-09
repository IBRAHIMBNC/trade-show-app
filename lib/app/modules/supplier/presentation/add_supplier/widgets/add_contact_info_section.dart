import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/modules/supplier/presentation/add_supplier/add_supplier_controller.dart';
import 'package:supplier_snap/app/utils/auth_validators.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/custom_text_field.dart';

class AddContactInfoSection extends GetView<AddSupplierController> {
  const AddContactInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: controller.addContactInfoFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText.label24b800(
              'Add Contact Info',
              fontWeight: FontWeight.w600,
            ),
            32.verticalSpace,
            CustomTextField(
              controller: controller.phoneController,
              onSave: (val) => controller.phone = val!.trim(),
              hinText: 'Phone Number',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.phone,
              validator: (val) =>
                  AuthValidators.requiredField(val, 'Phone Number'),
            ),
            16.verticalSpace,
            CustomTextField(
              controller: controller.emailController,
              onSave: (val) => controller.email = val!.trim(),
              hinText: 'Email',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              validator: (val) => AuthValidators.requiredField(val, 'Email'),
            ),
            16.verticalSpace,
            CustomTextField(
              controller: controller.wechatController,
              onSave: (val) => controller.weChatID = val,
              hinText: 'WeChat ID',
              textInputAction: TextInputAction.next,
              validator: (val) =>
                  AuthValidators.requiredField(val, 'WeChat ID'),
            ),
            16.verticalSpace,
            CustomTextField(
              controller: controller.whatsappController,
              onSave: (val) => controller.whatsAppNumber = val,
              hinText: 'WhatsApp Number',
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.phone,
              validator: (val) =>
                  AuthValidators.requiredField(val, 'WhatsApp Number'),
            ),
            16.verticalSpace,
          ],
        ),
      ),
    );
  }
}
