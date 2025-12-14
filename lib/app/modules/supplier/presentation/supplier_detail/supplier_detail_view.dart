import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/k_icons.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/core/extensions/double.dart';
import 'package:supplier_snap/app/widgets/custom_image.dart';
import 'package:supplier_snap/app/widgets/custom_tabbar.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/glowing_border_button.dart';
import 'package:supplier_snap/app/widgets/my_back_button.dart';
import 'package:supplier_snap/app/widgets/my_container.dart';
import 'package:supplier_snap/app/widgets/my_list_tile.dart';
import 'package:supplier_snap/app/widgets/we_chat_whatsapp_btn.dart';

import 'supplier_detail_controller.dart';

class SupplierDetailView extends GetView<SupplierDetailController> {
  const SupplierDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() => _buildBody()));
  }

  Padding _buildBody() {
    final topPadding = MediaQuery.paddingOf(Get.context!).top;
    if (controller.isLoading.value) {
      return Padding(
        padding: EdgeInsets.only(
          right: kPadding20.w,
          left: kPadding20.w,
          top: topPadding.h,
        ),
        child: Center(child: CircularProgressIndicator(color: KColors.brand)),
      );
    }
    return Padding(
      padding: kPadding20.hp,
      child: SingleChildScrollView(
        child: Column(
          spacing: 12.h,
          children: [
            topPadding.verticalSpace,
            _buildProfileCard(),
            WeChatAndWhatsappBtns(bgColor: KColors.primaryBg),
            MyContainer(
              width: double.infinity,
              padding: kPadding8.all,
              child: Obx(
                () => Column(
                  children: [
                    CustomTabbar(
                      onTabChanged: (index) {
                        controller.tabIndex.value = index;
                      },
                      tabController: controller.tabController,
                      tabs: [
                        Tab(text: 'Scoring'),
                        Tab(text: 'Info'),
                        Tab(text: 'Remarks'),
                      ],
                    ),
                    12.verticalSpace,
                    controller.tabViews[controller.tabIndex.value],
                  ],
                ),
              ),
            ),
            _buildAddTile(
              title: 'Products',
              countingStream: controller.productsCountStream,
              onTap: controller.gotoProductListing,
              onAddTap: controller.goToAddProduct,
            ),
            _buildAddTile(
              title: 'Notes',
              countingStream: controller.notesCountStream,
              onTap: controller.gotoNotes,
            ),
            _buildAddTile(
              title: 'Files',
              countingStream: controller.filesCountStream,
              onTap: controller.gotoFiles,
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }

  Widget _buildAddTile({
    required String title,
    required Stream<int> countingStream,
    Function()? onTap,
    Function()? onAddTap,
  }) {
    return StreamBuilder(
      stream: countingStream,
      builder: (context, snap) {
        final countingStream = snap.data ?? 0;
        return MyContainer(
          padding: kPadding4.all,
          radius: 40.r,
          child: MyListTile(
            onTap: onTap,
            horizontalSpacing: 8.w,
            leading: CircleAvatar(
              radius: 17.r,
              backgroundColor: KColors.white,
              child: CustomText.label14b400(countingStream.toString()),
            ),

            title: CustomText.label12b400(title),
            trailing: Row(
              children: [
                HighlightedEdgeButton(
                  onTap: onAddTap,
                  child: Icon(Icons.add, color: KColors.black, size: 20.sp),
                ),
                20.horizontalSpace,
                Icon(
                  CupertinoIcons.chevron_forward,
                  size: 15.w,
                  color: KColors.black60,
                ),
                8.horizontalSpace,
              ],
            ),
          ),
        );
      },
    );
  }

  MyListTile _buildProfileCard() {
    return MyListTile(
      border: BorderSide(color: KColors.black5, width: 1),
      radius: 50.r,
      padding: kPadding8.all,
      leading: Row(
        children: [
          MyBackButton(height: 50.h, width: 30.w),
          8.horizontalSpace,
          CircleAvatar(
            radius: 28.r,
            backgroundColor: KColors.brand,
            child: CustomImage.cirlce(
              controller.supplier.absoluteImagePath ?? '',
              size: 53.w,
              hideChild: controller.supplier.absoluteImagePath != null,
              backgroundColor: KColors.white,
              child: CustomImage.icon(
                KIcons.user,
                size: 22.sp,
                color: KColors.black,
              ),
            ),
          ),
        ],
      ),
      horizontalSpacing: 8.w,
      title: Padding(
        padding: kPadding8.right,
        child: CustomText.label16b600(
          controller.supplier.name,
          maxLines: 2,
          fontWeight: FontWeight.w600,
        ),
      ),
      verticalSpacing: 2.h,
      subtitle: Row(
        children: [
          Expanded(
            child: CustomText.label12b400(
              controller.supplier.company,
              maxLines: 1,
              color: KColors.black60,
            ),
          ),
        ],
      ),
      trailing: MyContainer(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
        color: KColors.primaryBg,
        radius: 30.r,
        child: Row(
          children: [
            MyContainer(
              radius: 30.r,
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
              color: KColors.white,
              child: CustomImage.icon(KIcons.ranking, size: 22.w),
            ),
            8.horizontalSpace,
            CustomText.label16b600('8', fontWeight: FontWeight.normal),
            8.horizontalSpace,
          ],
        ),
      ),
    );
  }
}
