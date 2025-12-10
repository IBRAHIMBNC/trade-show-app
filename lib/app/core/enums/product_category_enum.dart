enum ProductCategoryEnum {
  electronics('Electronics'),
  apparel('Apparel'),
  homeAndKitchen('Home & Kitchen'),
  books('Books'),
  beautyAndPersonalCare('Beauty & Personal Care'),
  sportsAndOutdoors('Sports & Outdoors'),
  toysAndGames('Toys & Games'),
  automotive('Automotive'),
  healthAndWellness('Health & Wellness'),
  groceries('Groceries'),
  others('Others');

  static ProductCategoryEnum fromName(String name) {
    try {
      return ProductCategoryEnum.values.byName(name);
    } catch (e) {
      return ProductCategoryEnum.electronics;
    }
  }

  static ProductCategoryEnum fromDisplayName(String displayName) {
    return ProductCategoryEnum.values.firstWhere(
      (e) => e.displayName.toLowerCase() == displayName.toLowerCase(),
      orElse: () => ProductCategoryEnum.others,
    );
  }

  final String displayName;
  const ProductCategoryEnum(this.displayName);
}
