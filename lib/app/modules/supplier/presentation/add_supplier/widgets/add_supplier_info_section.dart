import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/core/enums/industry_type_enum.dart';
import 'package:supplier_snap/app/core/enums/interest_level_enum.dart';
import 'package:supplier_snap/app/core/enums/product_type_enum.dart';
import 'package:supplier_snap/app/modules/supplier/presentation/add_supplier/add_supplier_controller.dart';
import 'package:supplier_snap/app/utils/auth_validators.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/custom_text_field.dart';
import 'package:supplier_snap/app/widgets/my_drop_down.dart';
import 'package:supplier_snap/app/widgets/user_profile_avatar.dart';

class AddSupplierInfoSection extends GetView<AddSupplierController> {
  const AddSupplierInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: controller.addSupplerInfoFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText.label24b800(
              'Add Supplier Info',
              fontWeight: FontWeight.w600,
            ),
            32.verticalSpace,
            Obx(
              () => UserProfileAvatar(
                onTap: controller.pickImage,
                imageUrl: controller.imageUrl,
                imageFile: controller.selectedImage.value?.path,
              ),
            ),
            32.verticalSpace,
            CustomTextField(
              controller: controller.fullNameController,
              onSave: (val) => controller.fullName = val!.trim(),
              hinText: 'Full Name',
              textInputAction: TextInputAction.next,
              validator: (val) =>
                  AuthValidators.requiredField(val, 'Full Name'),
            ),
            16.verticalSpace,
            CustomTextField(
              controller: controller.companyController,
              onSave: (val) => controller.company = val!.trim(),
              hinText: 'Company',
              textInputAction: TextInputAction.next,
              validator: (val) => AuthValidators.requiredField(val, 'Company'),
            ),
            16.verticalSpace,
            CustomTextField(
              controller: controller.boothController,
              onSave: (val) => controller.booth = val!.trim(),
              hinText: 'Booth',
              textInputAction: TextInputAction.next,
              validator: (val) => AuthValidators.requiredField(val, 'Booth'),
            ),
            16.verticalSpace,
            CustomTextField(
              controller: controller.locationController,
              onSave: (val) => controller.location = val!.trim(),
              hinText: 'Country',
              textInputAction: TextInputAction.done,
              validator: (val) => AuthValidators.requiredField(val, 'Country'),
            ),
            16.verticalSpace,
            MyDropDownButton(
              isExpanded: true,
              labelText: 'Select Industry',
              value: controller.industryEnum?.displayName,
              onChanged: (val) {
                controller.industryEnum = IndustryTypeEnum.fromDisplayName(val);
              },
              items: IndustryTypeEnum.values.map((e) => e.displayName).toList(),
            ),
            16.verticalSpace,
            MyDropDownButton(
              isExpanded: true,
              labelText: 'Interest Level',
              value: controller.selectedInterestLevel?.displayName,
              onChanged: (val) {
                controller.selectedInterestLevel =
                    InterestLevelEnum.fromDisplayName(val);
              },
              items: InterestLevelEnum.values
                  .map((e) => e.displayName)
                  .toList(),
            ),
            16.verticalSpace,
            MyDropDownButton(
              isExpanded: true,
              labelText: 'Product Type',
              value: controller.productTypeEnum?.displayName,
              onChanged: (val) {
                controller.productTypeEnum = ProductTypeEnum.fromDisplayName(
                  val,
                );
              },
              items: ProductTypeEnum.values.map((e) => e.displayName).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
