import 'dart:ui';

enum InterestLevelEnum {
  high('High', Color(0xFF4CAF50)),
  medium('Medium', Color(0xFFFFC107)),
  low('Low', Color(0xFFF44336));

  static InterestLevelEnum fromString(String? value) {
    if (value == null) {
      return InterestLevelEnum.low;
    }
    return InterestLevelEnum.values.firstWhere(
      (e) => e.name.toLowerCase() == value.toLowerCase(),
      orElse: () => InterestLevelEnum.low,
    );
  }

  static InterestLevelEnum? fromDisplayName(String val) {
    try {
      return InterestLevelEnum.values.firstWhere(
        (e) => e.displayName.toLowerCase() == val.toLowerCase(),
      );
    } catch (e) {
      return null;
    }
  }

  final String displayName;
  final Color color;
  const InterestLevelEnum(this.displayName, this.color);
}
