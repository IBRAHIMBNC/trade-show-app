import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/core/extensions/double.dart';
import 'package:supplier_snap/app/modules/products/presentation/widgets/add_edit_product.dart';
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
              spacing: 16.h,
              children: [
                UploadPhotos(),
                CustomTextField(
                  hinText: 'Name',
                  controller: controller.nameController,
                  validator: (value) =>
                      AuthValidators.requiredField(value, 'Name'),
                ),
                MyDropDownButton(
                  isExpanded: true,
                  validator: (value) =>
                      AuthValidators.requiredField(value, 'Category'),
                  hint: 'Select Category',
                  items: [],
                  onChanged: (value) {},
                ),
                CustomTextField(
                  hinText: 'Specifications',
                  lines: 4,
                  controller: controller.specificationsController,
                  validator: (value) =>
                      AuthValidators.requiredField(value, 'Specifications'),
                ),
                CustomTextField(
                  hinText: 'Price per unit',
                  controller: controller.priceController,
                  validator: AuthValidators.validatePrice,
                ),
                CustomTextField(
                  hinText: 'MOQs (Minimum Order Quantity)',
                  controller: controller.moqController,
                  validator: AuthValidators.validateMOQ,
                ),
                CustomTextField(
                  hinText: 'Lead Time',
                  controller: controller.leadTimeController,
                  validator: (value) =>
                      AuthValidators.requiredField(value, 'Lead Time'),
                ),
                CustomTextField(
                  hinText: 'Certifications',
                  controller: controller.certificationsController,
                ),
                CustomTextField(
                  hinText: 'Notes/ Internel Comments',
                  lines: 4,
                  controller: controller.notesController,
                ),
                RoundedButton('Add Product', onTap: controller.addProduct),
                SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
