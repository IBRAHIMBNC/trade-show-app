import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/k_icons.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/core/extensions/double.dart';
import 'package:supplier_snap/app/modules/comparison/presentation/widgets/comparison_card.dart';
import 'package:supplier_snap/app/widgets/my_appbar.dart';

import 'comparison_controller.dart';

class ComparisonView extends GetView<ComparisonController> {
  const ComparisonView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Comparison',
        actionBtnIcon: KIcons.export,
        actionBtnTitle: 'Export',
        onActionBtnPressed: () {
          controller.showExportOptions();
        },
      ),
      body: ListView.separated(
        padding: kPadding16.all,
        itemBuilder: (context, index) {
          final supplier = controller.selectedSuppliers[index];
          return ComparisonCard(index: index, supplier: supplier);
        },
        separatorBuilder: (context, index) => 12.verticalSpace,
        itemCount: controller.selectedSuppliers.length,
      ),
    );
  }
}
