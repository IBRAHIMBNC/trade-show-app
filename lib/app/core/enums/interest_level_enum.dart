enum InterestLevelEnum {
  high('High'),
  medium('Medium'),
  low('Low');

  static InterestLevelEnum fromString(String? value) {
    if (value == null) {
      return InterestLevelEnum.low;
    }
    return InterestLevelEnum.values.firstWhere(
      (e) => e.name.toLowerCase() == value.toLowerCase(),
      orElse: () => InterestLevelEnum.low,
    );
  }

  final String displayName;
  const InterestLevelEnum(this.displayName);

  static InterestLevelEnum? fromDisplayName(String val) {
    try {
      return InterestLevelEnum.values.firstWhere(
        (e) => e.displayName.toLowerCase() == val.toLowerCase(),
      );
    } catch (e) {
      return null;
    }
  }
}
