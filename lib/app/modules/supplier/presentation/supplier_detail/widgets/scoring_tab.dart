import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/core/extensions/double.dart';
import 'package:supplier_snap/app/modules/supplier/data/models/scores_model.dart';
import 'package:supplier_snap/app/modules/supplier/presentation/supplier_detail/supplier_detail_controller.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/my_container.dart';

class ScoringTab extends GetView<SupplierDetailController> {
  const ScoringTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ScoringBoard(
        scores: controller.scores.value,
        onChanged: (scores) {
          controller.scores.value = scores;
        },
      ),
    );
  }
}

class ScoringBoard extends StatelessWidget {
  const ScoringBoard({
    super.key,
    required this.scores,
    this.onChanged,
    this.bgColor = KColors.white,
  });

  final ScoresModel scores;
  final Function(ScoresModel scores)? onChanged;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      color: bgColor,
      width: double.infinity,
      padding: kPadding16.all,
      child: Column(
        spacing: 8.h,
        children: [
          SupplierScoringRow(
            title: 'Cost',
            score: scores.cost,
            onChanged: (score) => onChnagedHandler(cost: score),
          ),
          SupplierScoringRow(
            title: 'Quality',
            score: scores.quality,
            onChanged: (score) => onChnagedHandler(quality: score),
          ),
          SupplierScoringRow(
            title: 'Lead Time',
            score: scores.leadTime,
            onChanged: (score) => onChnagedHandler(leadTime: score),
          ),
          SupplierScoringRow(
            title: 'Certifications',
            score: scores.certifications,
            onChanged: (score) => onChnagedHandler(certifications: score),
          ),
          SupplierScoringRow(
            title: 'Fit',
            score: scores.fit,
            onChanged: (score) => onChnagedHandler(fit: score),
            showDivider: false,
          ),
        ],
      ),
    );
  }

  onChnagedHandler({
    int? cost,
    int? quality,
    int? leadTime,
    int? certifications,
    int? fit,
  }) {
    if (onChanged != null) {
      final newScores = scores.copyWith(
        cost: cost ?? scores.cost,
        quality: quality ?? scores.quality,
        leadTime: leadTime ?? scores.leadTime,
        certifications: certifications ?? scores.certifications,
        fit: fit ?? scores.fit,
      );
      onChanged!(newScores);
    }
  }
}

class SupplierScoringRow extends StatelessWidget {
  const SupplierScoringRow({
    super.key,
    required this.title,
    required this.score,
    this.onChanged,
    this.showDivider = true,
  });

  final String title;
  final int score;
  final Function(int score)? onChanged;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    final RxInt currentScore = score.obs;
    return Column(
      children: [
        Row(
          children: [
            CustomText.label14b400(title),
            Spacer(),
            MyContainer(
              padding: kPadding4.all,
              radius: 50.r,
              color: Colors.white,
              border: BorderSide(color: KColors.lightGrey2, width: 1.w),
              child: Obx(
                () => Row(
                  children: [
                    MyContainer(
                      onTap: () {
                        if (currentScore.value > 0) {
                          currentScore.value--;
                          if (onChanged != null) {
                            onChanged!(currentScore.value);
                          }
                        }
                      },
                      height: 30.w,
                      width: 30.w,
                      color: KColors.lightGrey2,
                      child: Icon(
                        Icons.remove,
                        size: 15.w,
                        color: KColors.black,
                      ),
                    ),
                    6.horizontalSpace,
                    CustomText.label16b600(
                      currentScore.value.toString(),
                      color: KColors.black,
                    ),
                    6.horizontalSpace,
                    MyContainer(
                      onTap: () {
                        if (currentScore.value < 10) {
                          currentScore.value++;
                          if (onChanged != null) {
                            onChanged!(currentScore.value);
                          }
                        }
                      },
                      height: 30.w,
                      width: 30.w,
                      color: KColors.lightGrey2,
                      child: Icon(Icons.add, size: 15.w, color: KColors.black),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        if (showDivider) ...[
          Divider(thickness: 1, color: KColors.black5, height: 16.h),
        ],
      ],
    );
  }
}
