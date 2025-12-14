import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/k_icons.dart';
import 'package:supplier_snap/app/constants/k_images.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/core/extensions/double.dart';
import 'package:supplier_snap/app/modules/supplier/presentation/home/widgets/supplier_details_card.dart';
import 'package:supplier_snap/app/routes/app_pages.dart';
import 'package:supplier_snap/app/widgets/custom_image.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/custom_text_field.dart';
import 'package:supplier_snap/app/widgets/my_container.dart';
import 'package:supplier_snap/app/widgets/rounded_button/my_rounded_button.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.paddingOf(context).top;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: topPadding.h,
            horizontal: kPadding20.w,
          ),
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (controller.suppliers.isNotEmpty) ...[
                  _buildSearchBar(),
                  10.verticalSpace,
                ],
                _buildSupplierList(),
                // Expanded(
                //   child: ListView.separated(
                //     padding: EdgeInsets.zero,
                //     children: [
                //       20.verticalSpace,
                //       _buildAddSupplierCard(),
                //       24.verticalSpace,
                //       SupplierDetailsCard(),
                //       12.verticalSpace,
                //       SupplierDetailsCard(),
                //       50.verticalSpace,
                //     ],
                //   ),
                // ),
                // Text('HomeView is working', style: TextStyle(fontSize: 20)),
                // 20.verticalSpace,
                // RoundedButton(
                //   'Logout',
                //   onTap: () {
                //     controller.logout();
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded _buildSupplierList() {
    if (controller.suppliers.isEmpty) {
      return _buildEmptyState();
    }
    return Expanded(
      child: CustomScrollView(
        slivers: [
          12.verticalSpaceSliver,
          SliverToBoxAdapter(child: _buildAddSupplierCard()),
          16.verticalSpaceSliver,
          Obx(() {
            return SliverList.separated(
              itemCount: controller.suppliers.length,
              itemBuilder: (context, index) {
                return SupplierDetailsCard(
                  supplier: controller.suppliers[index],
                  onDeleteTap: () {
                    controller.onDeleteSupplierTap(
                      controller.suppliers[index].id!,
                    );
                  },
                  onEditTap: () {
                    controller.onEditSupplierTap(controller.suppliers[index]);
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return 16.verticalSpace;
              },
            );
          }),
          45.verticalSpaceSliver,
        ],
      ),
    );
  }

  Expanded _buildEmptyState() {
    return Expanded(
      child: Column(
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
                CustomText.label16b600(
                  'Add New Supplier',
                  color: KColors.black,
                ),
              ],
            ),
            onTap: () {
              Get.toNamed(Routes.ADD_SUPPLIER);
            },
          ),
          80.verticalSpace,
        ],
      ),
    );
  }

  MyContainer _buildAddSupplierCard() {
    return MyContainer(
      width: double.infinity,
      padding: kPadding16.all,
      color: KColors.brand,
      child: Column(
        children: [
          MyContainer(
            color: Colors.transparent,
            radius: 60.r,
            padding: EdgeInsets.only(
              top: 4.h,
              bottom: 4.h,
              left: 16.w,
              right: 4.w,
            ),
            border: BorderSide(color: KColors.white60, width: 1),
            child: Row(
              children: [
                CustomText.label16b600(
                  'Suppliers',
                  fontWeight: FontWeight.normal,
                ),
                Spacer(),
                MyContainer(
                  radius: 50.r,
                  color: KColors.white40,
                  padding: kPadding8.all,
                  child: Obx(
                    () => Row(
                      children: [
                        12.horizontalSpace,
                        CustomText.label16b600(
                          controller.suppliers.length.toString(),
                          fontWeight: FontWeight.w500,
                        ),
                        20.horizontalSpace,
                        if (controller.suppliers.isNotEmpty) ...[
                          _buildCircleOverlappedProfiles(
                            controller.suppliers
                                .take(3)
                                .map(
                                  (e) =>
                                      e.absoluteImagePath ?? KImages.blackLogo,
                                )
                                .toList(),
                          ),
                          8.horizontalSpace,
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          16.verticalSpace,
          RoundedButton.filledMedium(
            Row(
              children: [
                Icon(Icons.add, color: KColors.black, size: 15.sp),
                8.horizontalSpace,
                CustomText.label14b400(
                  'Add New Supplier',
                  color: KColors.black,
                ),
              ],
            ),
            onTap: () {
              Get.toNamed(Routes.ADD_SUPPLIER);
            },
            backgroundColor: KColors.white,
          ),
        ],
      ),
    );
  }

  CustomTextField _buildSearchBar() {
    return CustomTextField(
      borderRadius: 50.r,
      hinText: 'Search',
      suffixWidget: MyContainer(
        height: 40.h,
        width: 52.w,
        margin: EdgeInsets.only(right: 8.w),
        radius: 50.r,
        color: KColors.white,
        alignment: Alignment.center,
        child: CustomImage(KIcons.search, width: 20.h, height: 20.h),
      ),
    );
  }

  _buildCircleOverlappedProfiles(List<String> imagePaths) {
    return SizedBox(
      height: 40.h,
      child: Row(
        children: List.generate(imagePaths.length, (index) {
          return Align(
            widthFactor: 0.5,
            child: CustomImage.cirlce(
              imagePaths[index],
              size: 30.r,
              backgroundColor: Colors.red,
            ),
          );
        }),
      ),
    );
  }
}

extension on int {
  get verticalSpaceSliver =>
      SliverToBoxAdapter(child: SizedBox(height: toDouble().h));
}
