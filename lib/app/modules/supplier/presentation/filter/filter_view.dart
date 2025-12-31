import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/core/enums/industry_type_enum.dart';
import 'package:supplier_snap/app/core/enums/interest_level_enum.dart';
import 'package:supplier_snap/app/core/enums/product_type_enum.dart';
import 'package:supplier_snap/app/core/extensions/double.dart';
import 'package:supplier_snap/app/modules/supplier/presentation/filter/filter_controller.dart';
import 'package:supplier_snap/app/widgets/custom_tabbar.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/my_appbar.dart';
import 'package:supplier_snap/app/widgets/my_choice_chip.dart';
import 'package:supplier_snap/app/widgets/my_container.dart';
import 'package:supplier_snap/app/widgets/rounded_button/my_rounded_button.dart';

class FilterView extends GetView<FilterController> {
  const FilterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Filters',
        actions: [
          TextButton(
            child: CustomText.label14b400('Clear All'),
            onPressed: () {
              controller.clearAllFilters();
            },
          ),
        ],
      ),
      body: Obx(
        () => ListView(
          padding: kPadding20.all,
          children: [
            CustomText.label16b600(
              'Interest Level',
              color: KColors.black,
              fontWeight: FontWeight.normal,
            ),
            12.verticalSpace,
            CustomTabbar(
              isDisabled: controller.filterSort.value.interestLevel == null,
              bgColor: KColors.primaryBg,
              tabController: controller.interestLevelTabController,
              onTabChanged: controller.onInterestLevelTabChanged,
              tabs: InterestLevelEnum.values
                  .map((e) => Tab(text: e.displayName))
                  .toList(),
            ),
            12.verticalSpace,
            CustomText.label16b600(
              'Industry',
              color: KColors.black,
              fontWeight: FontWeight.normal,
            ),
            12.verticalSpace,
            Wrap(
              runSpacing: 12.h,
              children: IndustryTypeEnum.values
                  .map(
                    (e) => MyChoiceChip(
                      onChanged: (val) {
                        controller.onIndustryTypeChipChanged(e, val);
                      },
                      text: e.displayName,
                      value: controller.filterSort.value.industryType.contains(
                        e,
                      ),
                    ),
                  )
                  .toList(),
            ),
            20.verticalSpace,
            CustomText.label16b600(
              'Product Type',
              color: KColors.black,
              fontWeight: FontWeight.normal,
            ),
            12.verticalSpace,
            Wrap(
              runSpacing: 12.h,
              children: ProductTypeEnum.values
                  .map(
                    (e) => MyChoiceChip(
                      onChanged: (val) {
                        controller.onProductTypeChipChanged(e, val);
                      },
                      text: e.displayName,
                      value: controller.filterSort.value.productType.contains(
                        e,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyContainer(
        color: KColors.white,
        shadow: BoxShadow(
          color: KColors.black10,
          blurRadius: 10.r,
          offset: Offset(0, -2.h),
        ),
        padding: kPadding20.all,
        child: RoundedButton('Apply Filter', onTap: controller.applyFilter),
      ),
    );
  }
}
