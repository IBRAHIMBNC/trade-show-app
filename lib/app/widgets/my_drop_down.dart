import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/my_container.dart';

/// A custom drop-down button widget.
class MyDropDownButton extends StatefulWidget {
  /// Creates a [MyDropDownButton].
  ///
  /// The [items] parameter must not be null.
  const MyDropDownButton({
    super.key,
    required this.items,
    this.onChanged,
    this.value,
    this.isExpanded,
    this.hint,
    this.bgColor,
    this.height,
    this.width,
    this.radius,
    this.fontSize,
    this.validator,
    this.labelText,
  });

  /// The list of items to display in the drop-down menu.
  final List<String> items;

  /// Called when the user selects an item.
  final Function(String val)? onChanged;

  /// The currently selected value.
  final String? value;

  /// The hint text to display when no value is selected.
  final String? hint;

  /// Whether the drop-down menu should be expanded to fill its parent.
  final bool? isExpanded;

  /// The background color of the drop-down button.
  final Color? bgColor;

  /// The height of the drop-down button.
  final double? height;

  /// The width of the drop-down button.
  final double? width;

  /// The border radius of the drop-down button.
  final double? radius;

  /// The font size of the drop-down button items.
  final int? fontSize;

  final String? Function(String? val)? validator;

  final String? labelText;

  @override
  State<MyDropDownButton> createState() => _MyDropDownButtonState();
}

class _MyDropDownButtonState extends State<MyDropDownButton> {
  String? value;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      radius: widget.radius ?? 15.r,
      // height: widget.height ?? 70.h,
      width: widget.width ?? (widget.isExpanded == true ? null : 0.35.sw),
      // width: widget.width ?? 0.35.sw,
      color: widget.bgColor ?? KColors.primaryBg,

      // border: BorderSide(
      //   color: AppColors.blackColor.withOpacity(0.2),
      // ),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(
        horizontal: kPadding20.w,
        vertical: kPadding4.h,
      ),

      child: DropdownButtonFormField<String>(
        validator: widget.validator,
        menuMaxHeight: 0.5.sh,
        borderRadius: BorderRadius.circular(widget.radius ?? 15.r),
        dropdownColor: KColors.primaryBg,
        alignment: Alignment.centerLeft,
        hint: widget.hint == null
            ? null
            : CustomText.label14b400(widget.hint!, color: KColors.textColor2),
        icon: Icon(CupertinoIcons.chevron_down, size: 15.sp),
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: AppTextStyles.label14b400.copyWith(
            color: KColors.textColor2,
          ),
          border: InputBorder.none,
          fillColor: widget.bgColor ?? KColors.primaryBg,
        ),
        isExpanded: widget.isExpanded ?? true,
        initialValue: value,
        items: widget.items
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: CustomText.label14b400(
                  e,
                  fontSize: widget.fontSize?.toDouble(),
                ),
              ),
            )
            .toList(),
        onChanged: widget.onChanged == null
            ? null
            : (val) {
                setState(() {
                  value = val!;
                  widget.onChanged?.call(val);
                });
              },
      ),
    );
  }
}
