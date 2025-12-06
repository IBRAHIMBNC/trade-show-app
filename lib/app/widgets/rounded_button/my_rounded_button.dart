import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';

part 'rounded_button_styles.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
    this.label, {
    super.key,
    this.onTap,
    this.isLoading = false,
    this.isFilled = true,
    this.fontSize = 14,
    this.backgroundColor,
    this.fontColor,
    this.radius = 15,
    this.isDense = false,
    this.padding,
    this.fontWeight,
    this.isDisabled = false,
    this.borderSide,
    this.height,
    this.width,
    this.size,
    this.style,
  });

  final dynamic label;
  final double? height;
  final double? width;
  final Function()? onTap;
  final Size? size;
  final bool isLoading;
  final bool isFilled;
  final int fontSize;
  final Color? backgroundColor;
  final Color? fontColor;
  final bool isDense;
  final double radius;
  final FontWeight? fontWeight;
  final EdgeInsets? padding;
  final bool isDisabled;
  final BorderSide? borderSide;
  final ButtonStyle? style;

  static const _primaryColor = KColors.brand;

  factory RoundedButton.filledMedium(
    dynamic label, {
    Function()? onTap,
    bool isLoading = false,
    Color? backgroundColor,
    Color? fontColor,
    int fontSize = 14,
    FontWeight fontWeight = FontWeight.w600,
  }) {
    return RoundedButton(
      label,
      onTap: onTap,
      isLoading: isLoading,
      backgroundColor: backgroundColor,
      fontColor: fontColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      style: ElevatedButtonStyles.filledMediumStyle.copyWith(
        backgroundColor: WidgetStateProperty.all<Color>(
          backgroundColor ?? _primaryColor,
        ),
      ),
    );
  }

  factory RoundedButton.filledSmall(
    String label, {
    Function()? onTap,
    bool isLoading = false,
    Color? backgroundColor,
    Color? fontColor,
    int fontSize = 12,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return RoundedButton(
      label,
      onTap: onTap,
      isLoading: isLoading,
      backgroundColor: backgroundColor,
      fontColor: fontColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      style: ElevatedButtonStyles.filledSmallStyle.copyWith(
        backgroundColor: WidgetStateProperty.all<Color>(
          backgroundColor ?? _primaryColor,
        ),
      ),
    );
  }

  factory RoundedButton.filledLight(
    String label, {
    Function()? onTap,
    bool isLoading = false,
    Color? backgroundColor,
    Color? fontColor = _primaryColor,
    int fontSize = 14,
    FontWeight? fontWeight,
  }) {
    return RoundedButton(
      label,
      onTap: onTap,
      isLoading: isLoading,
      backgroundColor: backgroundColor,
      fontColor: fontColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      style: ElevatedButtonStyles.filledLightStyle.copyWith(
        backgroundColor: WidgetStateProperty.all<Color>(
          backgroundColor ?? _primaryColor,
        ),
      ),
    );
  }

  factory RoundedButton.filledLightMedium(
    String label, {
    Function()? onTap,
    bool isLoading = false,
    Color? backgroundColor,
    Color? fontColor = _primaryColor,
    int fontSize = 14,
    FontWeight? fontWeight,
  }) {
    return RoundedButton(
      label,
      onTap: onTap,
      isLoading: isLoading,
      fontColor: fontColor = _primaryColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      style: ElevatedButtonStyles.filledLightMediumStyle.copyWith(
        backgroundColor: WidgetStateProperty.all<Color>(
          backgroundColor ?? _primaryColor,
        ),
      ),
    );
  }
  factory RoundedButton.filledLightSmall(
    String label, {
    Function()? onTap,
    bool isLoading = false,
    Color? backgroundColor,
    Color? fontColor = _primaryColor,
    int fontSize = 12,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return RoundedButton(
      label,
      onTap: onTap,
      isLoading: isLoading,
      backgroundColor: backgroundColor,
      fontColor: fontColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      style: ElevatedButtonStyles.filledLightSmallStyle.copyWith(
        backgroundColor: WidgetStateProperty.all<Color>(
          backgroundColor ?? _primaryColor,
        ),
      ),
    );
  }
  factory RoundedButton.outlined(
    String label, {
    Function()? onTap,
    bool isLoading = false,
    Color? backgroundColor,
    Color? fontColor = _primaryColor,
    int fontSize = 14,
    FontWeight fontWeight = FontWeight.w600,
    BorderSide? borderSide,
  }) {
    return RoundedButton(
      label,
      onTap: onTap,
      isLoading: isLoading,
      borderSide: borderSide,
      backgroundColor: backgroundColor,
      fontColor: fontColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      isFilled: false,
    );
  }

  factory RoundedButton.outlinedMedium(
    String label, {
    Function()? onTap,
    bool isLoading = false,
    Color? backgroundColor,
    Color? fontColor = _primaryColor,
    int fontSize = 14,
    FontWeight fontWeight = FontWeight.w600,
  }) {
    return RoundedButton(
      label,
      onTap: onTap,
      isLoading: isLoading,
      backgroundColor: backgroundColor,
      fontColor: fontColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      style: ElevatedButtonStyles.outlineMediumStyle.copyWith(
        backgroundColor: WidgetStateProperty.all<Color>(
          backgroundColor ?? _primaryColor,
        ),
      ),
    );
  }

  factory RoundedButton.outlinedSmall(
    String label, {
    Function()? onTap,
    bool isLoading = false,
    Color? backgroundColor,
    Color? fontColor = _primaryColor,
    int fontSize = 12,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return RoundedButton(
      label,
      onTap: onTap,
      isLoading: isLoading,
      backgroundColor: backgroundColor,
      fontColor: fontColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      style: ElevatedButtonStyles.outlineSmallStyle.copyWith(
        backgroundColor: WidgetStateProperty.all<Color>(
          backgroundColor ?? _primaryColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isFilled
        ? _buildFilledButton(context)
        : _buildOutlinedButton(context);
  }

  ElevatedButton _buildFilledButton(BuildContext context) {
    return ElevatedButton(
      style:
          style ??
          ElevatedButtonStyles.filledStyle.copyWith(
            side: borderSide != null
                ? WidgetStateProperty.all<BorderSide?>(borderSide)
                : null,
            backgroundColor: WidgetStateProperty.all<Color>(
              backgroundColor ?? _primaryColor,
            ),
            maximumSize: WidgetStateProperty.all<Size?>(
              isDense ? null : Size(1.sw, 61.h),
            ),
            fixedSize: WidgetStateProperty.all<Size?>(
              isDense ? null : size ?? Size(0.92.sw, 61.h),
            ),
            padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
              padding ?? EdgeInsets.zero,
            ),
            surfaceTintColor: WidgetStateProperty.all<Color>(
              backgroundColor ?? _primaryColor,
            ),
            overlayColor: WidgetStateProperty.all<Color>(
              backgroundColor ?? _primaryColor.withOpacity(0.1),
            ),
          ),
      onPressed: isLoading ? () {} : onTap,
      child: isLoading
          ? const CircularProgressIndicator.adaptive(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if ((label is String) && label.trim().isNotEmpty)
                  CustomText(
                    !isLoading ? label : 'Loading...',
                    color: fontColor ?? KColors.black,
                    size: fontSize,
                    fontWeight: fontWeight ?? FontWeight.w600,
                  )
                else if (label is Widget)
                  label,
              ],
            ),
    );
  }

  OutlinedButton _buildOutlinedButton(BuildContext context) {
    return OutlinedButton(
      style: (style ?? ElevatedButtonStyles.outlineStyle).copyWith(
        side: borderSide != null
            ? WidgetStateProperty.all<BorderSide?>(borderSide)
            : null,
        maximumSize: WidgetStateProperty.all<Size?>(
          isDense ? null : Size(1.sw, 0.09.sh),
        ),
        fixedSize: WidgetStateProperty.all<Size?>(
          isDense ? null : size ?? Size(0.92.sw, 56.h),
        ),
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          padding ?? EdgeInsets.zero,
        ),
        surfaceTintColor: WidgetStateProperty.all<Color>(
          backgroundColor ?? _primaryColor,
        ),
        overlayColor: WidgetStateProperty.all<Color>(
          backgroundColor ?? _primaryColor.withOpacity(0.1),
        ),
      ),
      onPressed: isLoading ? null : onTap,
      child: isLoading
          ? const CircularProgressIndicator.adaptive(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if ((label is String) && label.trim().isNotEmpty)
                  CustomText(
                    !isLoading ? label : 'Loading...',
                    color: fontColor ?? _primaryColor,
                    size: fontSize,
                    fontWeight: fontWeight ?? FontWeight.w600,
                  )
                else if (label is Widget)
                  label,
              ],
            ),
    );
  }
}
