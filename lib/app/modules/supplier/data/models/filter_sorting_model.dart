// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:supplier_snap/app/core/enums/industry_type_enum.dart';
import 'package:supplier_snap/app/core/enums/interest_level_enum.dart';
import 'package:supplier_snap/app/core/enums/product_type_enum.dart';

class FilterSortingModel {
  List<IndustryTypeEnum> industryType;
  List<ProductTypeEnum> productType;
  InterestLevelEnum? interestLevel;

  FilterSortingModel({
    this.industryType = const [],
    this.productType = const [],
    this.interestLevel,
  });

  bool get isFilterApplied {
    return interestLevel != null ||
        industryType.isNotEmpty ||
        productType.isNotEmpty;
  }

  FilterSortingModel copyWith({
    List<IndustryTypeEnum>? industryType,
    List<ProductTypeEnum>? productType,
    InterestLevelEnum? interestLevel,
  }) {
    return FilterSortingModel(
      industryType: industryType ?? this.industryType,
      productType: productType ?? this.productType,
      interestLevel: interestLevel ?? this.interestLevel,
    );
  }
}
