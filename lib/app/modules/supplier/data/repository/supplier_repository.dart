import 'package:dartz/dartz.dart';
import 'package:supplier_snap/app/core/failures/failures.dart';
import 'package:supplier_snap/app/core/services/auth_service.dart';
import 'package:supplier_snap/app/modules/auth/data/repository/auth_repository.dart';
import 'package:supplier_snap/app/modules/supplier/data/datasources/supplier_local_datasource.dart';
import 'package:supplier_snap/app/modules/supplier/data/datasources/supplier_remote_datasource.dart';
import 'package:supplier_snap/app/modules/supplier/data/models/supplier_model.dart';

class SupplierRepository extends BaseRepository {
  final SupplierLocalDatasource localSource;
  final SupplierRemoteDatasource remoteSource;

  SupplierRepository({
    required this.localSource,
    required this.remoteSource,
    required super.connectivityService,
  });

  /// Create a new supplier (local database only)
  Future<Either<Failure, SupplierModel>> createSupplier(
    SupplierModel supplier,
  ) async {
    try {
      final userId = AuthService.instance.currentUser?.id;
      if (userId == null) {
        return Left(CommonFailure("User not logged in"));
      }

      // Set userId and timestamps
      final supplierWithUser = supplier.copyWith(
        userId: userId,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      // Save to local database
      final id = await localSource.insertSupplier(supplierWithUser);
      return Right(supplierWithUser.copyWith(id: id));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  /// Get all suppliers (multi-user access)
  /// Returns all suppliers from local database
  Future<Either<Failure, List<SupplierModel>>> getAllSuppliers() async {
    try {
      final localData = await localSource.getAllSuppliers();
      final suppliers = localData
          .map((e) => SupplierModel.fromDatabaseModel(e))
          .toList();
      return Right(suppliers);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  /// Get suppliers added by current user only
  Future<Either<Failure, List<SupplierModel>>> getMySuppliers() async {
    try {
      final userId = AuthService.instance.currentUser?.id;
      if (userId == null) {
        return Left(CommonFailure("User not logged in"));
      }

      final localData = await localSource.getSuppliersByUserId(userId);
      final suppliers = localData
          .map((e) => SupplierModel.fromDatabaseModel(e))
          .toList();
      return Right(suppliers);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  /// Get a single supplier by ID
  Future<Either<Failure, SupplierModel>> getSupplierById(int id) async {
    try {
      final localData = await localSource.getSupplierById(id);
      if (localData == null) {
        return Left(CommonFailure("Supplier not found"));
      }
      return Right(SupplierModel.fromDatabaseModel(localData));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  /// Update a supplier
  Future<Either<Failure, SupplierModel>> updateSupplier(
    int id,
    SupplierModel supplier,
  ) async {
    try {
      // Update timestamps
      final updatedSupplier = supplier.copyWith(updatedAt: DateTime.now());

      // Update in local database
      await localSource.updateSupplier(id, updatedSupplier);

      return Right(updatedSupplier);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  /// Delete a supplier
  Future<Either<Failure, void>> deleteSupplier(int id) async {
    try {
      // Delete from local database
      await localSource.deleteSupplier(id);

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  /// Search suppliers
  Future<Either<Failure, List<SupplierModel>>> searchSuppliers(
    String query,
  ) async {
    try {
      final localData = await localSource.searchSuppliers(query);
      final suppliers = localData
          .map((e) => SupplierModel.fromDatabaseModel(e))
          .toList();
      return Right(suppliers);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  /// Clear all suppliers from local database
  Future<Either<Failure, void>> clearAllSuppliers() async {
    try {
      await localSource.clearAllSuppliers();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Stream<List<SupplierModel>> get watchMySuppliers {
    final userId = AuthService.instance.currentUser?.id ?? '';
    return localSource
        .watchSuppliersByUserId(userId)
        .map(
          (dataList) => dataList
              .map((data) => SupplierModel.fromDatabaseModel(data))
              .toList(),
        );
  }
}
