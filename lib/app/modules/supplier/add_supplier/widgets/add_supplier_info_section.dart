import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/k_icons.dart';
import 'package:supplier_snap/app/modules/supplier/add_supplier/add_supplier_controller.dart';
import 'package:supplier_snap/app/utils/auth_validators.dart';
import 'package:supplier_snap/app/widgets/custom_image.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/custom_text_field.dart';
import 'package:supplier_snap/app/widgets/my_container.dart';
import 'package:supplier_snap/app/widgets/my_drop_down.dart';

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
            UserProfileAvatar(),
            32.verticalSpace,
            CustomTextField(
              controller: controller.fullNameController,
              hinText: 'Full Name',
              textInputAction: TextInputAction.next,
              validator: (val) =>
                  AuthValidators.requiredField(val, 'Full Name'),
            ),
            16.verticalSpace,
            CustomTextField(
              controller: controller.companyController,
              hinText: 'Company',
              textInputAction: TextInputAction.next,
              validator: (val) => AuthValidators.requiredField(val, 'Company'),
            ),
            16.verticalSpace,
            CustomTextField(
              controller: controller.boothController,
              hinText: 'Booth',
              textInputAction: TextInputAction.next,
              validator: (val) => AuthValidators.requiredField(val, 'Booth'),
            ),
            16.verticalSpace,
            CustomTextField(
              controller: controller.locationController,
              hinText: 'Location',
              textInputAction: TextInputAction.done,
              validator: (val) => AuthValidators.requiredField(val, 'Location'),
            ),
            16.verticalSpace,
            MyDropDownButton(
              isExpanded: true,
              hint: 'Select Industry',
              onChanged: (val) {
                controller.selectedIndustry = val;
              },
              items: ['Industry 1', 'Industry 2', 'Industry 3'],
            ),
            16.verticalSpace,
            MyDropDownButton(
              isExpanded: true,
              hint: 'Interest Level',
              onChanged: (val) {
                controller.selectedInterestLevel = val;
              },
              items: ['Industry 1', 'Industry 2', 'Industry 3'],
            ),
          ],
        ),
      ),
    );
  }
}

class UserProfileAvatar extends StatelessWidget {
  const UserProfileAvatar({
    super.key,
    this.imageUrl,
    this.onTap,
    this.imageFile,
  });

  final String? imageUrl;
  final String? imageFile;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      onTap: onTap,
      color: Colors.transparent,
      height: 100.h,
      width: 100.w,
      child: Stack(
        children: [
          if (imageUrl != null || imageFile != null)
            CustomImage.cirlce(
              imageFile ?? imageUrl!,
              radius: 50.r,
              size: 100.sp,
            )
          else
            CircleAvatar(
              radius: 50.r,
              backgroundColor: KColors.primaryBg,
              child: CustomImage.icon(
                KIcons.user,
                size: 29.sp,
                color: KColors.black,
              ),
            ),
          Positioned(
            bottom: 5,
            right: 5,
            child: CircleAvatar(
              radius: 12.r,
              backgroundColor: KColors.black,
              child: Icon(Icons.camera_alt, color: KColors.white, size: 15.r),
            ),
          ),
        ],
      ),
    );
  }
}
