import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supplier_snap/app/constants/colors.dart';

part 'app_text_styles.dart';

class CustomText extends StatelessWidget {
  final Color? color;
  final String text;
  final double height;
  final int size;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final TextOverflow overflow;
  final TextStyle? style;
  final int? maxLines;
  final TextDecoration? decoration;
  final bool autoSized;
  final double? minSize;
  final double? maxSize;
  // final String fontFamily;

  const CustomText(
    this.text, {
    super.key,
    this.color,
    this.size = 12,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.center,
    this.height = 1,
    this.overflow = TextOverflow.visible,
    this.style,
    this.maxLines,
    this.decoration,
    this.autoSized = false,
    this.minSize,
    this.maxSize,
  });

  factory CustomText.label32b700(
    String text, {
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
    FontWeight? fontWeight,
  }) {
    return CustomText(
      text,
      style: AppTextStyles.label32b700.copyWith(
        color: color,
        fontSize: fontSize?.sp,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
      autoSized: true,
      minSize: 12,
    );
  }

  factory CustomText.label26b800(
    String text, {
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
  }) {
    return CustomText(
      text,
      style: AppTextStyles.label26b800.copyWith(
        color: color,
        fontSize: fontSize?.sp,
      ),
      textAlign: textAlign,
      autoSized: true,
      minSize: 12,
    );
  }

  factory CustomText.label24b800(
    String text, {
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
    FontWeight? fontWeight,
  }) {
    return CustomText(
      text,
      style: AppTextStyles.label24b800.copyWith(
        color: color,
        fontSize: fontSize?.sp,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
      autoSized: true,
      minSize: 12,
    );
  }

  factory CustomText.label20b800(
    String text, {
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
    FontWeight? fontWeight,
  }) {
    return CustomText(
      text,
      style: AppTextStyles.label20b800.copyWith(
        color: color,
        fontSize: fontSize?.sp,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
      autoSized: true,
      minSize: 12,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  factory CustomText.label18b600(
    String text, {
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
    FontWeight? fontWeight,
  }) {
    return CustomText(
      text,
      style: AppTextStyles.label18b600.copyWith(
        color: color,
        fontSize: fontSize?.sp,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
      autoSized: true,
      minSize: 12,
    );
  }

  factory CustomText.label16b600(
    String text, {
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
    FontWeight? fontWeight,
  }) {
    return CustomText(
      text,
      style: AppTextStyles.label16b600.copyWith(
        color: color,
        fontSize: fontSize?.sp,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
      autoSized: true,
      minSize: 12,
    );
  }

  factory CustomText.label14b600(
    String text, {
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
    int? maxLines,
    FontWeight? fontWeight,
  }) {
    return CustomText(
      text,
      style: AppTextStyles.label14b600.copyWith(
        color: color,
        fontSize: fontSize?.sp,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
      autoSized: true,
      minSize: 12,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines ?? 2,
    );
  }

  factory CustomText.label14b400(
    String text, {
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
  }) {
    return CustomText(
      text,
      style: AppTextStyles.label14b400.copyWith(
        color: color,
        fontSize: fontSize?.sp,
      ),

      textAlign: textAlign,
      autoSized: true,
      minSize: 12,
    );
  }

  factory CustomText.label12b700(
    String text, {
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
  }) {
    return CustomText(
      text,
      style: AppTextStyles.label12b700.copyWith(
        color: color,
        fontSize: fontSize?.sp,
      ),
      textAlign: textAlign,
      autoSized: true,
      minSize: 12,
    );
  }

  factory CustomText.label12b400(
    String text, {
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
    bool autoSized = true,
    int? maxLines,
  }) {
    return CustomText(
      text,
      style: AppTextStyles.label12b400.copyWith(
        color: color,
        fontSize: fontSize?.sp,
      ),
      textAlign: textAlign,
      autoSized: autoSized,
      minSize: 10,
      maxLines: maxLines,
    );
  }

  factory CustomText.label10b400(
    String text, {
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
    int? maxLines,
  }) {
    return CustomText(
      text,
      style: AppTextStyles.label10b400.copyWith(
        color: color,
        fontSize: fontSize?.sp,
      ),
      textAlign: textAlign,
      autoSized: true,
      minSize: 8,
      maxLines: maxLines,
    );
  }
  @override
  Widget build(BuildContext context) {
    const defaultColor = KColors.textColor1;

    if (autoSized) {
      return AutoSizeText(
        text,
        overflow: overflow,
        textAlign: textAlign,
        maxLines: maxLines,
        minFontSize: minSize ?? style?.fontSize!.round().toDouble() ?? 4,
        maxFontSize: maxSize ?? double.infinity,
        style:
            style ??
            TextStyle(
              color: color ?? defaultColor,
              fontSize: size.sp,
              fontWeight: fontWeight,
              height: height,
              decoration: decoration,
            ),
      );
    } else {
      return Text(
        text,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        style:
            style ??
            TextStyle(
              color: color ?? defaultColor,
              fontSize: size.sp,
              fontWeight: fontWeight,
              height: height,
              decoration: decoration,
            ),
      );
    }
  }
}
