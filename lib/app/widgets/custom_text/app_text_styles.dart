part of 'custom_text.dart';

class AppTextStyles {
  static const Color _defaultColor = KColors.textColor1;
  static const String kcFontFamily = 'Outfit';

  // 32 , Outfit , Large Headings
  static TextStyle get label32b700 => TextStyle(
    fontFamily: kcFontFamily,
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    color: _defaultColor,
  );

  //26 , Outfit , bold Headings
  static TextStyle get label26b800 => TextStyle(
    fontFamily: kcFontFamily,
    fontSize: 26.sp,
    fontWeight: FontWeight.w800,
    color: _defaultColor,
  );

  //24 , Outfit , Big Headings
  static TextStyle get label24b800 => TextStyle(
    fontFamily: kcFontFamily,
    fontSize: 24.sp,
    fontWeight: FontWeight.w800,
    color: _defaultColor,
  );

  // 20 , Outfit , Medium Headings
  static TextStyle get label20b800 => TextStyle(
    fontFamily: kcFontFamily,
    fontSize: 20.sp,
    fontWeight: FontWeight.w800,
    color: _defaultColor,
  );

  //18 , Outfit ,bold Headings
  static TextStyle get label18b600 => TextStyle(
    fontFamily: kcFontFamily,
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: _defaultColor,
  );

  //16 , Outfit ,Small Headings
  static TextStyle get label16b600 => TextStyle(
    fontFamily: kcFontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: _defaultColor,
  );
  //14 , Bold Paragraph
  static TextStyle get label14b600 => TextStyle(
    fontFamily: kcFontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: _defaultColor,
  );
  //14 , Paragraph
  static TextStyle get label14b400 => TextStyle(
    fontFamily: kcFontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: _defaultColor,
  );

  // 12 , Small Bold
  static TextStyle get label12b700 => TextStyle(
    fontFamily: kcFontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.w700,
    color: _defaultColor,
  );
  //12 , Small
  static TextStyle get label12b400 => TextStyle(
    fontFamily: kcFontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: _defaultColor,
  );
  //10 , Smaller
  static TextStyle get label10b400 => TextStyle(
    fontFamily: kcFontFamily,
    fontSize: 10.sp,
    fontWeight: FontWeight.normal,
    color: _defaultColor,
  );
}
