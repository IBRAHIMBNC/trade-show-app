import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/core/extensions/double.dart';
import 'package:supplier_snap/app/modules/supplier/data/models/supplier_sort_by.dart';
import 'package:supplier_snap/app/modules/supplier/presentation/home/home_controller.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/my_container.dart';
import 'package:supplier_snap/app/widgets/rounded_button/my_rounded_button.dart';

class SupplierSortSheet extends GetView<HomeController> {
  const SupplierSortSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final Rx<SortyByOption> selectedSortBy =
        controller.currentSortBy.value.option.obs;
    final Rx<SortOrder> selectedSortOrder =
        controller.currentSortBy.value.order.obs;
    return MyContainer(
      color: KColors.white,
      padding: kPadding16.all,
      radius: 20.r,
      margin: EdgeInsets.symmetric(
        horizontal: kPadding16.w,
        vertical: kPadding20.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyContainer(
                onTap: Get.back,
                width: 34.w,
                height: 34.h,
                radius: 12.r,
                color: KColors.black5,
                margin: EdgeInsets.only(top: 16.h, bottom: 8.h),
                child: Icon(Icons.close, color: KColors.black60, size: 18.w),
              ),
              CustomText.label18b600('Sort By'),
              SizedBox(width: 34.w),
            ],
          ),
          12.verticalSpace,
          Obx(
            () => Column(
              spacing: 16.h,
              children: SortyByOption.values.map((e) {
                return _buildRadioOption(
                  title: e.displayName,
                  isSelected: selectedSortBy.value == e,
                  onTap: () {
                    selectedSortBy.value = e;
                  },
                );
              }).toList(),
            ),
          ),
          24.verticalSpace,
          CustomText.label16b600('Sort Order', fontWeight: FontWeight.w500),
          12.verticalSpace,
          Obx(
            () => Column(
              spacing: 16.h,
              mainAxisAlignment: MainAxisAlignment.start,
              children: SortOrder.values.map((e) {
                return _buildRadioOption(
                  title: e.displayName,
                  isSelected: selectedSortOrder.value == e,
                  onTap: () {
                    selectedSortOrder.value = e;
                  },
                );
              }).toList(),
            ),
          ),
          24.verticalSpace,
          RoundedButton(
            'Apply',
            onTap: () => controller.applySortBy(
              SupplierSortBy(
                option: selectedSortBy.value,
                order: selectedSortOrder.value,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRadioOption({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          MyContainer(
            width: 20.w,
            height: 20.h,
            radius: 10.r,
            padding: EdgeInsets.all(4.r),
            color: KColors.white,
            border: BorderSide(color: KColors.black60, width: 1),
            child: isSelected
                ? MyContainer(
                    width: 12.w,
                    height: 12.h,
                    radius: 6.r,
                    color: KColors.brand,
                  )
                : SizedBox.shrink(),
          ),
          12.horizontalSpace,
          CustomText.label16b600(title, fontWeight: FontWeight.normal),
        ],
      ),
    );
  }
}
