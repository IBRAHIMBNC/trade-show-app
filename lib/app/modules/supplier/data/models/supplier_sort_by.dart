class SupplierSortBy {
  final SortOrder order;
  final SortyByOption option;

  const SupplierSortBy({required this.order, required this.option});

  SupplierSortBy copyWith({SortOrder? order, SortyByOption? option}) {
    return SupplierSortBy(
      order: order ?? this.order,
      option: option ?? this.option,
    );
  }

  static SupplierSortBy get defaultSort {
    return SupplierSortBy(
      order: SortOrder.descending,
      option: SortyByOption.updatedAt,
    );
  }
}

enum SortyByOption {
  name('Name'),
  rank('Rank'),
  price('Price'),
  leadTime('Lead Time'),
  createdAt('Date Added'),
  updatedAt('Last Updated'),
  certification('Certification');

  final String displayName;
  const SortyByOption(this.displayName);
}

enum SortOrder {
  ascending('Ascending'),
  descending('Descending');

  final String displayName;
  const SortOrder(this.displayName);
}
