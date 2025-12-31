import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/my_container.dart';

class MyChoiceChip extends StatelessWidget {
  const MyChoiceChip({
    super.key,
    required this.text,
    required this.value,
    this.onChanged,
    this.isDisable = false,
    this.gap = kPadding8,
    this.radius,
    this.padding,
  });

  final String text;
  final bool value;
  final Function(bool?)? onChanged;
  final bool isDisable;
  final double gap;
  final double? radius;
  final EdgeInsetsGeometry? padding;

  Color get backgroundColor => value ? KColors.brand : KColors.textColor2;

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      onTap: isDisable
          ? null
          : () {
              onChanged!(value);
            },
      padding:
          padding ??
          const EdgeInsets.symmetric(
            horizontal: kPadding20,
            vertical: kPadding8,
          ),
      margin: EdgeInsets.only(right: gap),
      color: value ? KColors.white : KColors.primaryBg,
      radius: radius ?? 8.r,
      border: BorderSide(
        color: value ? KColors.brand : Colors.transparent,
        width: 1,
      ),
      child: CustomText.label12b400(text, color: KColors.textColor1),
    );
  }
}
