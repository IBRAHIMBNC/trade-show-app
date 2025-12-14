import 'package:drift/drift.dart';
import 'package:supplier_snap/app/core/database/app_db.dart';
import 'package:supplier_snap/app/modules/products/data/models/product_model.dart';
import 'package:supplier_snap/app/utils/my_utils.dart';

class ProductsLocalDatasource {
  final AppDatabase database;

  ProductsLocalDatasource({required this.database});

  /// Insert a new product into local database
  Future<int> insertProduct(ProductModel product) async {
    return await database
        .into(database.productTable)
        .insert(
          ProductTableCompanion(
            name: Value(product.name),
            price: Value(product.price),
            specifications: Value(product.specifications),
            notes: Value(product.notes),
            createdAt: Value(product.createdAt ?? DateTime.now()),
            category: Value(product.category.name),
            leadTimeDays: Value(product.leadTimeDays),
            supplierId: Value(product.supplierId),
            moq: Value(product.moq),
            moqUnit: Value(product.moqUnit),
            imageLocalPaths: Value(product.relativeImagePaths),
            imageUrls: Value(product.imageUrls),
            certifications: Value(product.certifications),
          ),
        );
  }

  /// Get all products from local database
  Future<List<ProductTableData>> getAllProducts() async {
    return await database.select(database.productTable).get();
  }

  /// Get products by supplier ID
  Future<List<ProductTableData>> getProductsBySupplierId(int supplierId) async {
    return await (database.select(
      database.productTable,
    )..where((tbl) => tbl.supplierId.equals(supplierId))).get();
  }

  /// Watch products by supplier ID (Stream for real-time updates)
  Stream<List<ProductTableData>> watchProductsBySupplierId(int supplierId) {
    return (database.select(
      database.productTable,
    )..where((tbl) => tbl.supplierId.equals(supplierId))).watch();
  }

  /// Get a single product by ID
  Future<ProductTableData?> getProductById(int id) async {
    return await (database.select(
      database.productTable,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  /// Update a product in local database
  Future<bool> updateProduct(int id, ProductModel product) async {
    return await database
        .update(database.productTable)
        .replace(
          ProductTableCompanion(
            id: Value(id),
            name: Value(product.name),
            price: Value(product.price),
            specifications: Value(product.specifications),
            notes: Value(product.notes),
            createdAt: Value(product.createdAt ?? DateTime.now()),
            category: Value(product.category.name),
            leadTimeDays: Value(product.leadTimeDays),
            supplierId: Value(product.supplierId),
            moq: Value(product.moq),
            moqUnit: Value(product.moqUnit),
            imageLocalPaths: Value(product.relativeImagePaths),
            imageUrls: Value(product.imageUrls),
            certifications: Value(product.certifications),
          ),
        );
  }

  /// Delete a product from local database
  Future<int> deleteProduct(int id) async {
    final product = await getProductById(id);

    // Delete product images
    if (product != null) {
      await deleteProductImages(product.imageLocalPaths);
    }

    return await (database.delete(
      database.productTable,
    )..where((tbl) => tbl.id.equals(id))).go();
  }

  /// Search products by name, category, or specifications
  Future<List<ProductTableData>> searchProducts(String query) async {
    final lowerQuery = query.toLowerCase();
    return await (database.select(database.productTable)..where(
          (tbl) =>
              tbl.name.lower().contains(lowerQuery) |
              tbl.category.lower().contains(lowerQuery) |
              tbl.specifications.lower().contains(lowerQuery),
        ))
        .get();
  }

  /// Get products by category
  Future<List<ProductTableData>> getProductsByCategory(String category) async {
    return await (database.select(
      database.productTable,
    )..where((tbl) => tbl.category.equals(category))).get();
  }

  /// Clear all products from local database
  Future<int> clearAllProducts() async {
    return await database.delete(database.productTable).go();
  }

  /// Sync products - replace all with fresh data from server
  Future<void> syncProducts(List<ProductModel> products) async {
    await database.transaction(() async {
      // Clear existing data
      await database.delete(database.productTable).go();

      // Insert new data
      for (final product in products) {
        await insertProduct(product);
      }
    });
  }

  /// Delete all products for a specific supplier
  Future<int> deleteProductsBySupplierId(int supplierId) async {
    // Delete products images
    final products = await getProductsBySupplierId(supplierId);

    Future.wait(
      products.map((p) => deleteProductImages(p.imageLocalPaths)).toList(),
    );

    return await (database.delete(
      database.productTable,
    )..where((tbl) => tbl.supplierId.equals(supplierId))).go();
  }

  Future<void> deleteProductImages(List<String>? imagePaths) async {
    if (imagePaths == null) return;
    for (var path in imagePaths) {
      await MyUtils.deletePermanentFile(path);
    }
  }
}
