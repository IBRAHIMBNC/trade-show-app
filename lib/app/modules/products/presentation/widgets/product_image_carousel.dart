import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/modules/products/presentation/product_details/product_details_controller.dart';
import 'package:supplier_snap/app/widgets/custom_image.dart';
import 'package:supplier_snap/app/widgets/my_container.dart';

class ImageCarousel extends GetView<ProductDetailsController> {
  const ImageCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 305.h,
            viewportFraction: 0.85,
            initialPage: 0,
            enableInfiniteScroll: false,
            reverse: false,
            autoPlay: false,
            autoPlayInterval: Duration(seconds: 5),
            autoPlayAnimationDuration: Duration(milliseconds: 600),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              controller.currentImageIndex.value = index;
            },
            scrollDirection: Axis.horizontal,
          ),
          items: controller.images.map((banner) {
            return CustomImage.fromSize(banner, size: 305.h, radius: 20.r);
          }).toList(),
        ),
        16.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(controller.images.length, (index) => index)
              .map((i) {
                return Obx(
                  () => MyContainer(
                    width: 8.w,
                    height: 8.h,
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    color: controller.currentImageIndex.value == i
                        ? KColors.brand
                        : KColors.lightGrey,
                  ),
                );
              })
              .toList(),
        ),
      ],
    );
  }
}
