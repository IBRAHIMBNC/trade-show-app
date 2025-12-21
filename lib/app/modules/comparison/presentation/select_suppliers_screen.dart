import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/k_icons.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/core/extensions/double.dart';
import 'package:supplier_snap/app/modules/comparison/presentation/comparison_controller.dart';
import 'package:supplier_snap/app/modules/comparison/presentation/widgets/supplier_profile_card.dart';
import 'package:supplier_snap/app/modules/supplier/data/models/supplier_model.dart';
import 'package:supplier_snap/app/routes/app_pages.dart';
import 'package:supplier_snap/app/widgets/custom_image.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/my_appbar.dart';
import 'package:supplier_snap/app/widgets/my_container.dart';
import 'package:supplier_snap/app/widgets/rounded_button/my_rounded_button.dart';

class SelectSuppliersScreen extends GetView<ComparisonController> {
  const SelectSuppliersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Select Suppliers',
        actionBtnTitle: 'Select All',
        actionBtnIcon: KIcons.greenCircle,
        onActionBtnPressed: controller.selectAllSuppliers,
      ),
      body: Obx(() => _buildBody()),

      bottomNavigationBar: Obx(
        () =>
            (controller.suppliers.isEmpty ||
                controller.selectedSuppliers.isEmpty)
            ? SizedBox.shrink()
            : MyContainer(
                color: KColors.white,
                shadow: BoxShadow(
                  color: KColors.black10,
                  blurRadius: 10.r,
                  offset: Offset(0, -2.h),
                ),
                padding: kPadding20.all,
                child: RoundedButton(
                  'Compare',
                  onTap: controller.goToComparisonView,
                ),
              ),
      ),
    );
  }

  Widget _buildBody() {
    if (controller.suppliers.isEmpty) {
      return _buildEmptyState();
    }
    return ListView.separated(
      padding: kPadding16.all,
      itemBuilder: (context, index) {
        return Obx(
          () => _buildProfileCard(
            supplier: controller.suppliers[index],
            isSelected: controller.selectedSuppliers.contains(
              controller.suppliers[index],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => 12.verticalSpace,
      itemCount: controller.suppliers.length,
    );
  }

  Widget _buildEmptyState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyContainer(
          radius: 200.r,
          width: 133.w,
          height: 133.h,
          color: null,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: KColors.primaryBg,
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: CustomImage.icon(KIcons.emptySuppliers, size: 120.w),
          ),
        ),
        24.verticalSpace,
        CustomText.label24b800(
          'No Suppliers Added Yet',
          fontWeight: FontWeight.w600,
        ),
        12.verticalSpace,
        Padding(
          padding: kPadding16.hp,
          child: CustomText.label12b400(
            'Start building your supplier database by adding your first contact.',
            color: KColors.black60,
            textAlign: TextAlign.center,
          ),
        ),
        24.verticalSpace,
        RoundedButton(
          Row(
            children: [
              Icon(Icons.add, color: KColors.black, size: 25.sp),
              8.horizontalSpace,
              CustomText.label16b600('Add New Supplier', color: KColors.black),
            ],
          ),
          onTap: () {
            Get.toNamed(Routes.ADD_SUPPLIER);
          },
        ),
        80.verticalSpace,
      ],
    );
  }

  Widget _buildProfileCard({
    required SupplierModel supplier,
    bool isSelected = false,
  }) {
    return MyContainer(
      onTap: () => controller.toggleSupplierSelection(supplier),
      radius: 50.r,
      padding: kPadding8.all,
      color: isSelected ? KColors.white : KColors.primaryBg,
      border: BorderSide(
        color: isSelected ? KColors.black5 : KColors.white,
        width: 2,
      ),
      child: Row(
        children: [
          4.horizontalSpace,
          MyContainer(
            height: 12.w,
            width: 12.w,
            color: isSelected ? KColors.brand : Colors.transparent,
            border: !isSelected
                ? BorderSide(color: KColors.white, width: 1)
                : null,
            padding: kPadding4.all,
          ),
          12.horizontalSpace,
          Expanded(child: SupplierProfileCard(supplier: supplier)),
        ],
      ),
    );
  }
}
