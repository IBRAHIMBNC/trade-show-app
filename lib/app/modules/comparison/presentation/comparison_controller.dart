import 'dart:io';

import 'package:excel/excel.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:supplier_snap/app/modules/comparison/presentation/comparison_view.dart';
import 'package:supplier_snap/app/modules/comparison/presentation/select_suppliers_screen.dart';
import 'package:supplier_snap/app/modules/supplier/data/models/supplier_model.dart';
import 'package:supplier_snap/app/modules/supplier/data/repository/supplier_repository.dart';
import 'package:supplier_snap/app/utils/loading_overlay.dart';
import 'package:supplier_snap/app/utils/snackbars.dart';
import 'package:supplier_snap/app/widgets/export_file_option_sheet.dart';

class ComparisonController extends GetxController {
  final SupplierRepository supplierRepository;
  ComparisonController({required this.supplierRepository});

  final RxList<SupplierModel> suppliers = <SupplierModel>[].obs;
  final RxList<SupplierModel> selectedSuppliers = <SupplierModel>[].obs;

  final RxBool isAllSelected = false.obs;

  goToSelectSuppliers() {
    Get.to(() => SelectSuppliersScreen());
  }

  goToComparisonView() {
    selectedSuppliers.sort((a, b) => b.scores.total.compareTo(a.scores.total));
    Get.to(() => ComparisonView());
  }

  toggleSupplierSelection(SupplierModel supplier) {
    if (selectedSuppliers.contains(supplier)) {
      selectedSuppliers.remove(supplier);
    } else {
      selectedSuppliers.add(supplier);
    }
  }

  selectAllSuppliers() {
    selectedSuppliers.assignAll(suppliers);
  }

  showExportOptions() {
    Get.bottomSheet(
      ExportOptionSheet(
        onCsvTap: () {
          Get.back();
          exportCsv();
        },
        onExcelTap: () {
          Get.back();
          exportExcel();
        },
      ),
    );
  }

  Future<void> exportExcel() async {
    try {
      isAppLoading = true;
      if (selectedSuppliers.isEmpty) {
        Get.snackbar(
          'No Suppliers Selected',
          'Please select suppliers to export',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      // Create Excel document
      final excel = Excel.createExcel();
      final exportDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
      final sheet = excel[exportDate];

      // Set column widths
      sheet.setColumnWidth(0, 8); // A - Rank
      sheet.setColumnWidth(1, 15); // B - Total Score
      sheet.setColumnWidth(2, 20); // C - Supplier Name
      sheet.setColumnWidth(3, 25); // D - Company Name
      sheet.setColumnWidth(4, 20); // E - Country
      sheet.setColumnWidth(5, 15); // F - Booth Number
      sheet.setColumnWidth(6, 20); // G - Industry
      sheet.setColumnWidth(7, 15); // H - Interest Level
      sheet.setColumnWidth(8, 20); // I - Product Type
      sheet.setColumnWidth(9, 12); // J - Cost Score
      sheet.setColumnWidth(10, 12); // K - Quality Score
      sheet.setColumnWidth(11, 12); // L - Lead Time Score
      sheet.setColumnWidth(12, 15); // M - Certifications Score
      sheet.setColumnWidth(13, 12); // N - Fit Score
      sheet.setColumnWidth(14, 20); // O - Phone
      sheet.setColumnWidth(15, 30); // P - Email
      sheet.setColumnWidth(16, 20); // Q - WhatsApp
      sheet.setColumnWidth(17, 15); // R - WeChat
      sheet.setColumnWidth(18, 15); // S - MOQ
      sheet.setColumnWidth(19, 20); // T - Lead Time
      sheet.setColumnWidth(20, 25); // U - Certifications
      sheet.setColumnWidth(21, 40); // V - Internal Remarks
      sheet.setColumnWidth(22, 20); // W - Last Updated Date

      // Create header row with styling
      final headerStyle = CellStyle(
        bold: true,
        backgroundColorHex: ExcelColor.blue,
        fontColorHex: ExcelColor.white,
      );

      final headers = [
        'Rank', // A
        'Total Score', // B
        'Supplier Name', // C
        'Company Name', // D
        'Country', // E
        'Booth Number', // F
        'Industry', // G
        'Interest Level', // H
        'Product Type', // I
        'Cost Score', // J
        'Quality Score', // K
        'Lead Time Score', // L
        'Certifications Score', // M
        'Fit Score', // N
        'Phone', // O
        'Email', // P
        'WhatsApp', // Q
        'WeChat', // R
        'Internal Remarks', // V
        'Last Updated Date', // W
      ];

      // Add headers
      for (var i = 0; i < headers.length; i++) {
        final cell = sheet.cell(
          CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 0),
        );
        cell.value = TextCellValue(headers[i]);
        cell.cellStyle = headerStyle;
      }

      // Add supplier data
      for (var rowIndex = 0; rowIndex < selectedSuppliers.length; rowIndex++) {
        final supplier = selectedSuppliers[rowIndex];
        final excelRow = rowIndex + 1; // +1 because row 0 is headers

        final rowData = [
          (rowIndex + 1).toString(), // A - Rank
          supplier.scores.total.toString(), // B - Total Score
          supplier.name, // C - Supplier Name
          supplier.company, // D - Company Name
          supplier.address ?? '', // E - Country (using address field)
          supplier.booth, // F - Booth Number
          supplier.industry?.displayName ?? '', // G - Industry
          supplier.interestLevel?.displayName ?? '', // H - Interest Level
          supplier.productType?.displayName ?? '', // I - Product Type
          supplier.scores.cost.toString(), // J - Cost Score
          supplier.scores.quality.toString(), // K - Quality Score
          supplier.scores.leadTime.toString(), // L - Lead Time Score
          supplier.scores.certifications.toString(), // M - Certifications Score
          supplier.scores.fit.toString(), // N - Fit Score
          supplier.phone ?? '', // O - Phone
          supplier.email ?? '', // P - Email
          supplier.whatsAppNumber ?? '', // Q - WhatsApp
          supplier.weChatID ?? '', // R - WeChat
          supplier.notes ?? '', // V - Internal Remarks
          DateFormat(
            'y-MM-dd, HH:mm',
          ).format(supplier.updatedAt ?? supplier.createdAt!),
        ];

        for (var colIndex = 0; colIndex < rowData.length; colIndex++) {
          final cell = sheet.cell(
            CellIndex.indexByColumnRow(
              columnIndex: colIndex,
              rowIndex: excelRow,
            ),
          );
          cell.value = TextCellValue(rowData[colIndex]);
        }
      }

      // Delete default sheet if it exists
      if (excel.sheets.containsKey('Sheet1')) {
        excel.delete('Sheet1');
      }

      // Save file
      final directory = await getApplicationDocumentsDirectory();
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final filePath = '${directory.path}/suppliers_comparison_$timestamp.xlsx';
      final file = File(filePath);
      await file.writeAsBytes(excel.encode()!);

      // Share the file
      await SharePlus.instance.share(ShareParams(files: [XFile(filePath)]));
      isAppLoading = false;
      showSuccessSnackbar(
        title: 'Export Successful',
        message: 'Excel file exported and ready to share',
      );
    } catch (e) {
      showErrorSnackbar(
        title: 'Export Failed',
        message: 'Error exporting to Excel: ${e.toString()}',
      );
    }
  }

  Future<void> exportCsv() async {
    try {
      isAppLoading = true;
      if (selectedSuppliers.isEmpty) {
        showErrorSnackbar(
          title: 'No Suppliers Selected',
          message: 'Please select suppliers to export',
        );
        return;
      }

      // Create CSV content
      final List<String> csvLines = [];

      // Add headers
      final headers = [
        'Rank',
        'Total Score',
        'Supplier Name',
        'Company Name',
        'Country',
        'Booth Number',
        'Industry',
        'Interest Level',
        'Product Type',
        'Cost Score',
        'Quality Score',
        'Lead Time Score',
        'Certifications Score',
        'Fit Score',
        'Phone',
        'Email',
        'WhatsApp',
        'WeChat',
        'Internal Remarks',
        'Last Updated Date',
      ];
      csvLines.add(headers.map((h) => _escapeCsvField(h)).join(','));

      // Add supplier data
      for (var rowIndex = 0; rowIndex < selectedSuppliers.length; rowIndex++) {
        final supplier = selectedSuppliers[rowIndex];

        final rowData = [
          (rowIndex + 1).toString(),
          supplier.scores.total.toString(),
          supplier.name,
          supplier.company,
          supplier.address ?? '',
          supplier.booth,
          supplier.industry?.displayName ?? '',
          supplier.interestLevel?.displayName ?? '',
          supplier.productType?.displayName ?? '',
          supplier.scores.cost.toString(),
          supplier.scores.quality.toString(),
          supplier.scores.leadTime.toString(),
          supplier.scores.certifications.toString(),
          supplier.scores.fit.toString(),
          supplier.phone ?? '',
          supplier.email ?? '',
          supplier.whatsAppNumber ?? '',
          supplier.weChatID ?? '',
          supplier.notes ?? '',
          DateFormat(
            'y-MM-dd, HH:mm',
          ).format(supplier.updatedAt ?? supplier.createdAt!),
        ];

        csvLines.add(rowData.map((field) => _escapeCsvField(field)).join(','));
      }

      // Save file
      final directory = await getApplicationDocumentsDirectory();
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final filePath = '${directory.path}/suppliers_comparison_$timestamp.csv';
      final file = File(filePath);
      await file.writeAsString(csvLines.join('\n'));

      // Share the file
      await SharePlus.instance.share(ShareParams(files: [XFile(filePath)]));
      isAppLoading = false;
      showSuccessSnackbar(
        title: 'Export Successful',
        message: 'CSV file exported and ready to share',
      );
    } catch (e) {
      showErrorSnackbar(
        title: 'Export Failed',
        message: 'Error exporting to CSV: ${e.toString()}',
      );
    }
  }

  /// Helper method to escape CSV fields
  String _escapeCsvField(String field) {
    // If field contains comma, newline, or quotes, wrap it in quotes and escape existing quotes
    if (field.contains(',') ||
        field.contains('\n') ||
        field.contains('"') ||
        field.contains('\r')) {
      return '"${field.replaceAll('"', '""')}"';
    }
    return field;
  }

  @override
  void onInit() {
    suppliers.bindStream(supplierRepository.watchMySuppliers);
    super.onInit();
  }
}
