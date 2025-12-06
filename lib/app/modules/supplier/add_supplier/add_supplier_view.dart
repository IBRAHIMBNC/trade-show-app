import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/widgets/my_container.dart';
import 'package:supplier_snap/app/widgets/rounded_button/my_rounded_button.dart';

import 'add_supplier_controller.dart';

class AddSupplierView extends GetView<AddSupplierController> {
  const AddSupplierView({super.key});

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: topPadding,
          left: kPadding20.w,
          right: kPadding20.w,
        ),
        child: Obx(
          () => Column(
            children: [
              Row(
                children: List.generate(3, (index) {
                  return Expanded(
                    child: MyContainer(
                      height: 5.h,
                      color: index <= controller.selectedIndex.value
                          ? KColors.black
                          : KColors.black20,
                      margin: EdgeInsets.symmetric(horizontal: 4.w),
                    ),
                  );
                }),
              ),
              20.verticalSpace,
              Expanded(
                child: controller.sections[controller.selectedIndex.value],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: kPadding20.w,
          right: kPadding20.w,
          bottom: 20.h,
          top: 10.h,
        ),
        child: Row(
          spacing: 8.w,
          children: [
            Expanded(
              child: RoundedButton(
                'Go Back',
                backgroundColor: KColors.primaryBg,
                onTap: controller.onBack,
              ),
            ),
            Expanded(
              child: Obx(
                () => RoundedButton(
                  controller.sections.length - 1 ==
                          controller.selectedIndex.value
                      ? 'Add'
                      : 'Next',
                  onTap: controller.onNext,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
