import 'package:flutter/material.dart';
import 'package:supplier_snap/app/constants/colors.dart';

class MyContainer extends Container {
  MyContainer({
    this.border,
    this.onTap,
    this.backgroundImage,
    this.radius = 20,
    this.height,
    this.width,
    this.shadow,
    super.key,
    super.child,
    this.color = KColors.primaryBg,
    super.decoration,
    super.foregroundDecoration,
    super.padding,
    super.alignment,
    super.margin,
    super.transform,
    super.transformAlignment,
    this.gradient,
  });

  @override
  final Color? color;
  final dynamic radius;
  final double? height;
  final double? width;
  final DecorationImage? backgroundImage;
  final Function()? onTap;
  final BoxShadow? shadow;
  final BorderSide? border;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        onTap: onTap,
        child: Container(
          key: key,
          height: height,
          width: width,
          decoration:
              decoration ??
              ShapeDecoration(
                gradient: gradient,
                shadows: [if (shadow != null) shadow!],
                color: gradient != null ? null : color ?? KColors.white,
                image: backgroundImage,
                shape: RoundedSuperellipseBorder(
                  borderRadius:
                      radius.runtimeType == int || radius.runtimeType == double
                      ? BorderRadius.circular(radius.toDouble())
                      : radius.runtimeType == BorderRadius
                      ? radius
                      : BorderRadius.zero,
                  side: border ?? BorderSide.none,
                ),
              ),
          foregroundDecoration: foregroundDecoration,
          padding: padding ?? EdgeInsets.zero,
          alignment: alignment,
          margin: margin,
          transform: transform,
          transformAlignment: transformAlignment,
          child: child,
        ),
      ),
    );
  }
}
