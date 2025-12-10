enum IndustryTypeEnum {
  manufacturing('Manufacturing'),
  wholesale('Wholesale'),
  retail('Retail'),
  services('Services'),
  technology('Technology'),
  healthcare('Healthcare'),
  finance('Finance'),
  education('Education'),
  construction('Construction'),
  transportation('Transportation'),
  agriculture('Agriculture'),
  entertainment('Entertainment'),
  hospitality('Hospitality'),
  realEstate('Real Estate'),
  energy('Energy'),
  telecommunications('Telecommunications'),
  other('Other');

  static IndustryTypeEnum? fromString(String? value) {
    if (value == null) return other;
    try {
      return IndustryTypeEnum.values.firstWhere(
        (e) => e.name.toLowerCase() == value.toLowerCase(),
      );
    } catch (e) {
      return other;
    }
  }

  final String displayName;
  const IndustryTypeEnum(this.displayName);

  static IndustryTypeEnum? fromDisplayName(String val) {
    try {
      return IndustryTypeEnum.values.firstWhere(
        (e) => e.displayName.toLowerCase() == val.toLowerCase(),
      );
    } catch (e) {
      return null;
    }
  }
}
