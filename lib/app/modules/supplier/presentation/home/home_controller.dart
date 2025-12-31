// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/k_icons.dart';
import 'package:supplier_snap/app/modules/supplier/data/models/dummy_suppliers.dart';
import 'package:supplier_snap/app/modules/supplier/data/models/filter_sorting_model.dart';
import 'package:supplier_snap/app/modules/supplier/data/models/supplier_model.dart';
import 'package:supplier_snap/app/modules/supplier/data/models/supplier_sort_by.dart';
import 'package:supplier_snap/app/modules/supplier/data/repository/supplier_repository.dart';
import 'package:supplier_snap/app/modules/supplier/presentation/home/widgets/sort_by_sheet.dart';
import 'package:supplier_snap/app/routes/app_pages.dart';
import 'package:supplier_snap/app/utils/bottom_sheets.dart';
import 'package:supplier_snap/app/utils/snackbars.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  final SupplierRepository supplierRepository;

  HomeController({required this.supplierRepository});

  final RxList<SupplierModel> suppliers = <SupplierModel>[].obs;

  final RxList<SupplierModel> filteredSuppliers = <SupplierModel>[].obs;

  final Rx<FilterSortingModel> filterSort = FilterSortingModel().obs;

  bool get isFilterApplied {
    return filterSort.value.isFilterApplied;
  }

  String? searchQuery;
  final RxBool isSearching = false.obs;

  final Rx<SupplierSortBy> currentSortBy = SupplierSortBy.defaultSort.obs;

  onDeleteSupplierTap(int supplierId) async {
    final confirmDeleteAction = await showConfirmationSheet(
      title: 'Delete Supplier',
      content: 'Do you want to delete this supplier?',
      iconPath: KIcons.delete,
    );
    if (confirmDeleteAction == true) {
      final result = await supplierRepository.deleteSupplier(supplierId);

      result.fold(
        (failure) {
          // Handle failure if needed
        },
        (data) {
          showSuccessSnackbar(message: 'Supplier deleted successfully.');
        },
      );
    }
  }

  searchSupplier(String query) async {
    if (query.isEmpty) {
      searchQuery = null;
      isSearching.value = false;
    } else {
      searchQuery = query;
      isSearching.value = true;
    }

    final result = await supplierRepository.getSuppliersByCriteria(
      query: searchQuery,
      filterSorting: isFilterApplied ? filterSort.value : null,
    );

    result.fold(
      (failure) {
        // Handle failure if needed
      },
      (data) {
        filteredSuppliers.assignAll(data);
      },
    );
  }

  gotoFilterScreen() async {
    final filterRsult = await Get.toNamed(
      Routes.FILTER,
      arguments: filterSort.value,
    );
    if (filterRsult != null && filterRsult is FilterSortingModel) {
      filterSort.value = filterRsult;
      searchSupplier(searchQuery ?? '');
    }
  }

  gotoSortingScreen() {
    Get.bottomSheet(
      SupplierSortSheet(
        // currentSorting: filterSort.value.sortBy,
        // onSortingSelected: (selectedSorting) {
        //   filterSort.value = filterSort.value.copyWith(sortBy: selectedSorting);
        //   searchSupplier(searchQuery ?? '');
        // },
      ),
      isScrollControlled: true,
    );
  }

  // void applyFilter() async {
  //   final result = await supplierRepository.getSuppliersByCriteria(
  //     query: searchQuery,
  //     filterSorting: filterSort.value,
  //   );
  //   result.fold(
  //     (failure) {
  //       // Handle failure if needed
  //     },
  //     (data) {
  //       filteredSuppliers.assignAll(data);
  //     },
  //   );
  //   Get.back();
  // }

  init() {
    for (var supplier in dummySuppliers) {
      supplierRepository.createSupplier(supplier);
    }
  }

  @override
  void onInit() {
    // init();
    suppliers.bindStream(supplierRepository.watchMySuppliers);
    super.onInit();
  }

  void onEditSupplierTap(SupplierModel supplier) {
    Get.toNamed(Routes.ADD_SUPPLIER, arguments: supplier);
  }

  applySortBy(SupplierSortBy supplierSortBy) {
    currentSortBy.value = supplierSortBy;
    sortSuppliers();
    Get.back();
  }

  sortSuppliers() {
    final option = currentSortBy.value.option;
    final order = currentSortBy.value.order;

    int compare(SupplierModel a, SupplierModel b) {
      int comparison = 0;
      switch (option) {
        case SortyByOption.name:
          comparison = a.name.compareTo(b.name);
          break;
        case SortyByOption.createdAt:
          if (a.createdAt == null || b.createdAt == null) {
            comparison = 0;
          } else {
            comparison = a.createdAt!.compareTo(b.createdAt!);
          }
          break;
        case SortyByOption.updatedAt:
          final aDate = a.updatedAt ?? a.createdAt;
          final bDate = b.updatedAt ?? b.createdAt;
          if (aDate == null || bDate == null) {
            comparison = 0;
          } else {
            comparison = aDate.compareTo(bDate);
          }
          break;
        case SortyByOption.rank:
          comparison = a.scores.total.compareTo(b.scores.total);
          break;
        case SortyByOption.price:
          comparison = a.scores.cost.compareTo(b.scores.cost);
          break;
        case SortyByOption.leadTime:
          comparison = a.scores.leadTime.compareTo(b.scores.leadTime);
          break;
        case SortyByOption.certification:
          comparison = a.scores.certifications.compareTo(
            b.scores.certifications,
          );
          break;
      }
      return order == SortOrder.ascending ? comparison : -comparison;
    }

    suppliers.sort(compare);
    filteredSuppliers.sort(compare);
  }
}
