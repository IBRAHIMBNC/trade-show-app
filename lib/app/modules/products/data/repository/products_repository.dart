import 'dart:developer' show log;

import 'package:dartz/dartz.dart';
import 'package:supplier_snap/app/core/failures/failures.dart';
import 'package:supplier_snap/app/modules/products/data/datasources/products_local_datasource.dart';
import 'package:supplier_snap/app/modules/products/data/models/product_model.dart';

class ProductsRepository {
  final ProductsLocalDatasource localDatasource;

  ProductsRepository({required this.localDatasource});

  /// Create a new product
  Future<Either<Failure, ProductModel>> createProduct(
    ProductModel product,
  ) async {
    try {
      final id = await localDatasource.insertProduct(product);
      final createdProduct = await localDatasource.getProductById(id);
      if (createdProduct != null) {
        return Right(ProductModel.fromDatabaseModel(createdProduct));
      }
      return Left(DatabaseFailure('Failed to create product'));
    } catch (e) {
      log(e.toString());
      return Left(DatabaseFailure(e.toString()));
    }
  }

  /// Get all products
  Future<Either<Failure, List<ProductModel>>> getAllProducts() async {
    try {
      final products = await localDatasource.getAllProducts();
      return Right(
        products.map((p) => ProductModel.fromDatabaseModel(p)).toList(),
      );
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  /// Get products by supplier ID
  Future<Either<Failure, List<ProductModel>>> getProductsBySupplierId(
    int supplierId,
  ) async {
    try {
      final products = await localDatasource.getProductsBySupplierId(
        supplierId,
      );
      return Right(
        products.map((p) => ProductModel.fromDatabaseModel(p)).toList(),
      );
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  /// Watch products by supplier ID (Stream)
  Stream<List<ProductModel>> watchProductsBySupplierId(int supplierId) {
    return localDatasource
        .watchProductsBySupplierId(supplierId)
        .map(
          (products) =>
              products.map((p) => ProductModel.fromDatabaseModel(p)).toList(),
        );
  }

  /// Get a single product by ID
  Future<Either<Failure, ProductModel>> getProductById(int id) async {
    try {
      final product = await localDatasource.getProductById(id);
      if (product != null) {
        return Right(ProductModel.fromDatabaseModel(product));
      }
      return Left(NotFoundFailure('Product not found'));
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  /// Update a product
  Future<Either<Failure, ProductModel>> updateProduct(
    int id,
    ProductModel product,
  ) async {
    try {
      final success = await localDatasource.updateProduct(id, product);
      if (success) {
        final updatedProduct = await localDatasource.getProductById(id);
        if (updatedProduct != null) {
          return Right(ProductModel.fromDatabaseModel(updatedProduct));
        }
      }
      return Left(DatabaseFailure('Failed to update product'));
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  /// Delete a product
  Future<Either<Failure, bool>> deleteProduct(int id) async {
    try {
      final result = await localDatasource.deleteProduct(id);
      return Right(result > 0);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  /// Search products
  Future<Either<Failure, List<ProductModel>>> searchProducts(
    String query,
  ) async {
    try {
      final products = await localDatasource.searchProducts(query);
      return Right(
        products.map((p) => ProductModel.fromDatabaseModel(p)).toList(),
      );
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  /// Get products by category
  Future<Either<Failure, List<ProductModel>>> getProductsByCategory(
    String category,
  ) async {
    try {
      final products = await localDatasource.getProductsByCategory(category);
      return Right(
        products.map((p) => ProductModel.fromDatabaseModel(p)).toList(),
      );
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  /// Delete all products for a supplier
  Future<Either<Failure, bool>> deleteProductsBySupplierId(
    int supplierId,
  ) async {
    try {
      final result = await localDatasource.deleteProductsBySupplierId(
        supplierId,
      );
      return Right(result > 0);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }
}
