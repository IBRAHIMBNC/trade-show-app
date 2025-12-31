import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/core/enums/industry_type_enum.dart';
import 'package:supplier_snap/app/core/enums/interest_level_enum.dart';
import 'package:supplier_snap/app/core/enums/product_type_enum.dart';
import 'package:supplier_snap/app/modules/supplier/data/models/filter_sorting_model.dart';

class FilterController extends GetxController with GetTickerProviderStateMixin {
  // Interest Level Filter Tab
  late final TabController interestLevelTabController = TabController(
    length: InterestLevelEnum.values.length,
    vsync: this,
    initialIndex: 0,
  );

  late final Rx<FilterSortingModel> filterSort = Rx<FilterSortingModel>(
    Get.arguments as FilterSortingModel? ?? FilterSortingModel(),
  );

  bool get isFilterApplied {
    return filterSort.value.isFilterApplied;
  }

  Function(int index)? get onInterestLevelTabChanged => (int index) {
    final selectedInterestLevel = InterestLevelEnum.values[index];
    filterSort.value = filterSort.value.copyWith(
      interestLevel: selectedInterestLevel,
    );
  };

  void clearAllFilters() {
    filterSort.value = FilterSortingModel();
    interestLevelTabController.index = 0;
  }

  void onIndustryTypeChipChanged(IndustryTypeEnum e, bool? val) {
    filterSort.value = filterSort.value.copyWith(
      industryType: filterSort.value.industryType.contains(e)
          ? (List.from(filterSort.value.industryType)..remove(e))
          : (List.from(filterSort.value.industryType)..add(e)),
    );
  }

  void onProductTypeChipChanged(ProductTypeEnum e, bool? val) {
    filterSort.value = filterSort.value.copyWith(
      productType: filterSort.value.productType.contains(e)
          ? (List.from(filterSort.value.productType)..remove(e))
          : (List.from(filterSort.value.productType)..add(e)),
    );
  }

  applyFilter() {
    Get.back(result: filterSort.value);
  }
}
