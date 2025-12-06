import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/k_icons.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';

class CustomTextField extends StatefulWidget {
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final AutovalidateMode? autoValidationMode;
  final String hinText;
  final Color? bgColor;
  final bool isPassword;
  final double? borderRadius;
  final String? Function(String? val)? validator;
  final Function(String? val)? onSave;
  final Size size;
  final String? suffixText;
  final int? minLines;
  final bool readOnly;
  final TextEditingController? controller;
  final int? lines;
  final bool obscureText;
  final Function(String? value)? onChanged;
  final String? prefixIcon;
  final Function()? onTap;
  final bool isUnderlineBorder;
  final Widget? suffixWidget;
  final Color? borderColor;
  final Widget? prefix;
  final EdgeInsetsGeometry? prefixIconPadding;
  final String? labelText;
  final TextInputAction textInputAction;
  final Function(String)? onFieldSubmitted;
  final String? errorText;
  final bool isDisabled;
  final double? verticalPadding;
  final EdgeInsetsGeometry? margin;
  final Color? fontColor;
  final List<String>? autofillHints;

  const CustomTextField({
    super.key,
    required this.hinText,
    this.isPassword = false,
    this.onSave,
    this.validator,
    this.bgColor,
    this.borderRadius = 15,
    this.size = const Size(95, 6),
    this.keyboardType = TextInputType.text,
    this.controller,
    this.autoValidationMode = AutovalidateMode.onUserInteraction,
    this.lines,
    this.onChanged,
    this.suffixText,
    this.onTap,
    this.minLines,
    this.readOnly = false,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixWidget,
    this.prefix,
    this.prefixIconPadding,
    this.isUnderlineBorder = false,
    this.borderColor,
    this.labelText,
    this.textInputAction = TextInputAction.done,
    this.onFieldSubmitted,
    this.errorText,
    this.isDisabled = false,
    this.verticalPadding,
    this.margin,
    this.fontColor,
    this.focusNode,
    this.autofillHints,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isVisible;
  bool showErrorMessage = false;
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();

    isVisible = widget.isPassword;
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final lightGreyColor = KColors.textColor2;
    final defaultTextFieldColor = KColors.primaryBg;
    final errorColor = KColors.errorColor;
    final defaultTextColor = KColors.textColor1;
    final defaultBorderColor = Colors.transparent;
    final iconPadding = EdgeInsets.only(
      right: kPadding16.w,
      left: kPadding4.w,
      bottom: kPadding12.h,
      top: kPadding12.h,
    );

    return TextFormField(
      focusNode: _focusNode,
      minLines: widget.minLines,
      onTap: widget.isDisabled ? null : widget.onTap,
      textInputAction: widget.textInputAction,
      onFieldSubmitted: widget.onFieldSubmitted,
      onChanged: (value) => widget.onChanged?.call(value),
      readOnly: widget.readOnly,
      maxLines: widget.lines ?? 1,
      style: AppTextStyles.label14b400.copyWith(
        color: widget.fontColor ?? defaultTextColor,
      ),
      autovalidateMode: widget.autoValidationMode,
      controller: widget.controller,
      validator: widget.validator,
      onSaved: widget.onSave,
      keyboardType: widget.keyboardType,
      obscureText: isVisible,
      cursorColor: lightGreyColor,
      autofillHints: widget.autofillHints,
      inputFormatters: [
        if (widget.keyboardType == TextInputType.number)
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        if (widget.keyboardType == TextInputType.number)
          CurrencyInputFormatter(),
      ],

      decoration: InputDecoration(
        errorText: showErrorMessage ? widget.errorText : null,
        contentPadding: EdgeInsets.symmetric(
          horizontal: kPadding16.w,
          vertical: widget.verticalPadding ?? 16.h,
        ),
        filled: true,
        fillColor: widget.bgColor ?? defaultTextFieldColor,
        hintStyle: AppTextStyles.label14b400.copyWith(color: KColors.black60),
        hintText: widget.hinText,
        errorStyle: AppTextStyles.label14b400.copyWith(
          color: errorColor,
          fontSize: 12.sp,
        ),
        constraints: BoxConstraints(minHeight: widget.size.height.h),
        alignLabelWithHint: true,
        suffixText: widget.suffixText,
        // label: widget.labelText == null ? null : Text(widget.labelText!),
        // labelStyle: AppTextStyles.paragraph14.copyWith(
        //   color: AppColors.textColor2,
        // ),
        labelText: widget.labelText,
        labelStyle: AppTextStyles.label14b400.copyWith(
          color: KColors.textColor2,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius!),
          borderSide: const BorderSide(color: Colors.red),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius!),
          borderSide: const BorderSide(color: Colors.red),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius!),
          borderSide: BorderSide(
            color: widget.borderColor ?? defaultBorderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius!),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        prefix: widget.prefix,
        prefixIcon: widget.prefixIcon == null
            ? null
            : Padding(
                padding:
                    widget.prefixIconPadding ??
                    EdgeInsets.only(
                      left: kPadding16.w,
                      right: kPadding4.w,
                      bottom: kPadding12.h,
                      top: kPadding12.h,
                    ),
                child: SvgPicture.asset(
                  color: _isFocused ? KColors.brand : KColors.textColor2,
                  widget.prefixIcon.toString(),
                ),
              ),
        suffixIcon: widget.isPassword
            ? InkWell(
                onTap: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                child: Padding(
                  padding: iconPadding,
                  child: SvgPicture.asset(
                    !isVisible ? KIcons.eyeOff : KIcons.eyeOn,
                    color: lightGreyColor,
                  ),
                ),
              )
            : widget.suffixWidget,
      ),
    );
  }
}

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    double value = double.parse(newValue.text);

    final formatter = NumberFormat.decimalPattern();

    String newText = formatter.format(value);

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
