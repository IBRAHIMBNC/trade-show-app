enum ProductTypeEnum {
  electronics('Electronics'),
  clothing('Clothing'),
  furniture('Furniture'),
  food('Food'),
  health('Health'),
  beauty('Beauty'),
  books('Books'),
  toys('Toys'),
  sports('Sports'),
  home('Home'),
  automotive('Automotive'),
  industrial('Industrial'),
  other('Other');

  static ProductTypeEnum fromName(String name) {
    try {
      return ProductTypeEnum.values.byName(name);
    } catch (e) {
      return ProductTypeEnum.other;
    }
  }

  static ProductTypeEnum fromDisplayName(String displayName) {
    return ProductTypeEnum.values.firstWhere(
      (e) => e.displayName.toLowerCase() == displayName.toLowerCase(),
      orElse: () => ProductTypeEnum.other,
    );
  }

  final String displayName;
  const ProductTypeEnum(this.displayName);
}
