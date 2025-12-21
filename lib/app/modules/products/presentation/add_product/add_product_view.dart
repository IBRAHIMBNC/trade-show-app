import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/core/enums/product_category_enum.dart';
import 'package:supplier_snap/app/core/extensions/double.dart';
import 'package:supplier_snap/app/modules/products/presentation/widgets/upload_photos.dart';
import 'package:supplier_snap/app/utils/auth_validators.dart';
import 'package:supplier_snap/app/widgets/custom_text_field.dart';
import 'package:supplier_snap/app/widgets/my_appbar.dart';
import 'package:supplier_snap/app/widgets/my_drop_down.dart';
import 'package:supplier_snap/app/widgets/rounded_button/my_rounded_button.dart';

import 'add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Add Products'),
      body: SingleChildScrollView(
        child: Padding(
          padding: kPadding20.hp,
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16.h,
              children: [
                UploadPhotos(),
                CustomTextField(
                  hinText: 'Name',
                  textInputAction: TextInputAction.next,
                  onSave: (val) {
                    controller.name = val!.trim();
                  },
                  controller: controller.nameController,
                  validator: (value) =>
                      AuthValidators.requiredField(value, 'Name'),
                ),
                MyDropDownButton(
                  isExpanded: true,
                  hint: 'Select Category',
                  value: controller.selectedCategory?.displayName,
                  items: ProductCategoryEnum.values
                      .map((e) => e.displayName)
                      .toList(),
                  onChanged: (value) {
                    controller.selectedCategory =
                        ProductCategoryEnum.fromDisplayName(value);
                  },
                ),
                CustomTextField(
                  textInputAction: TextInputAction.next,
                  hinText: 'Specifications',
                  onSave: (val) => controller.specifications = val!.trim(),
                  lines: 4,
                  controller: controller.specificationsController,
                  validator: (value) =>
                      AuthValidators.requiredField(value, 'Specifications'),
                ),
                CustomTextField(
                  textInputAction: TextInputAction.next,
                  hinText: 'Price per unit',
                  keyboardType: TextInputType.number,
                  onSave: (val) =>
                      controller.price = double.tryParse(val!.trim()) ?? 0.0,
                  controller: controller.priceController,
                  validator: AuthValidators.validatePrice,
                ),
                Row(
                  spacing: 12.w,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: CustomTextField(
                        onSave: (val) =>
                            controller.moq = int.tryParse(val!.trim()) ?? 0,
                        hinText: 'MOQ',
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        controller: controller.moqController,
                        validator: AuthValidators.validateMOQ,
                      ),
                    ),
                    Expanded(
                      child: CustomTextField(
                        onSave: (val) => controller.moqUnit = val!.trim(),
                        hinText: 'Unit',
                        textInputAction: TextInputAction.next,
                        controller: controller.moqUnitController,
                        validator: (val) {
                          if (val == null || val.trim().isEmpty) {
                            return 'required';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),

                CustomTextField(
                  hinText: 'Lead Time',
                  onSave: (val) =>
                      controller.leadTimeDays = int.tryParse(val!.trim()) ?? 0,
                  controller: controller.leadTimeController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  validator: (value) =>
                      AuthValidators.requiredField(value, 'Lead Time'),
                ),
                CustomTextField(
                  hinText: 'Certifications',
                  textInputAction: TextInputAction.next,
                  onSave: (val) => controller.certifications = val!.trim(),
                  controller: controller.certificationsController,
                ),
                CustomTextField(
                  hinText: 'Notes/ Internel Comments',
                  textInputAction: TextInputAction.newline,
                  onSave: (val) => controller.notes = val!.trim(),
                  lines: 5,
                  minLines: 4,
                  controller: controller.notesController,
                ),
                RoundedButton(
                  controller.isEdit ? 'Update Product' : 'Add Product',
                  onTap: controller.isEdit
                      ? controller.updateProduct
                      : controller.addProduct,
                ),
                SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
