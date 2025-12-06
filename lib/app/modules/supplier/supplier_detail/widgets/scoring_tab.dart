import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/widgets/my_container.dart';

class ScoringTab extends StatelessWidget {
  const ScoringTab({super.key});

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      color: KColors.white,
      height: 300.h,
      width: double.infinity,
    );
  }
}
