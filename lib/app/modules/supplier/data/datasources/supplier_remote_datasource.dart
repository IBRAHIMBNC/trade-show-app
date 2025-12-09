import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supplier_snap/app/modules/supplier/data/models/supplier_model.dart';

class SupplierRemoteDatasource {
  final supabase = Supabase.instance;

  /// Create a new supplier in Supabase
  /// This allows any authenticated user to create suppliers
  Future<SupplierModel> createSupplier(SupplierModel supplier) async {
    try {
      final response = await supabase.client
          .from('suppliers')
          .insert(supplier.toMap())
          .select()
          .single();

      return SupplierModel.fromMap(response);
    } catch (e) {
      rethrow;
    }
  }

  /// Get all suppliers from Supabase
  /// This retrieves ALL suppliers regardless of who added them (multi-user access)
  Future<List<SupplierModel>> getAllSuppliers() async {
    try {
      final response = await supabase.client
          .from('suppliers')
          .select()
          .order('created_at', ascending: false);

      return (response as List)
          .map((item) => SupplierModel.fromMap(item))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  /// Get suppliers added by a specific user
  Future<List<SupplierModel>> getSuppliersByUserId(String userId) async {
    try {
      final response = await supabase.client
          .from('suppliers')
          .select()
          .eq('user_id', userId)
          .order('created_at', ascending: false);

      return (response as List)
          .map((item) => SupplierModel.fromMap(item))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  /// Get suppliers added by the current logged-in user
  Future<List<SupplierModel>> getMySuppliers() async {
    try {
      final userId = supabase.client.auth.currentUser?.id;
      if (userId == null) {
        throw Exception('User not logged in');
      }
      return await getSuppliersByUserId(userId);
    } catch (e) {
      rethrow;
    }
  }

  /// Get a single supplier by ID
  /// Any user can view any supplier (multi-user access)
  Future<SupplierModel> getSupplierById(int id) async {
    try {
      final response = await supabase.client
          .from('suppliers')
          .select()
          .eq('id', id)
          .single();

      return SupplierModel.fromMap(response);
    } catch (e) {
      rethrow;
    }
  }

  /// Update a supplier
  /// Only the user who created it can update (optional: can be changed for multi-user edit)
  Future<SupplierModel> updateSupplier(int id, SupplierModel supplier) async {
    try {
      final response = await supabase.client
          .from('suppliers')
          .update(supplier.toMap())
          .eq('id', id)
          .select()
          .single();

      return SupplierModel.fromMap(response);
    } catch (e) {
      rethrow;
    }
  }

  /// Delete a supplier
  /// Only the user who created it can delete
  Future<void> deleteSupplier(int id, String userId) async {
    try {
      await supabase.client
          .from('suppliers')
          .delete()
          .eq('id', id)
          .eq('user_id', userId);
    } catch (e) {
      rethrow;
    }
  }

  /// Search suppliers by name or company
  /// Search across all suppliers (multi-user access)
  Future<List<SupplierModel>> searchSuppliers(String query) async {
    try {
      final response = await supabase.client
          .from('suppliers')
          .select()
          .or('name.ilike.%$query%,company.ilike.%$query%')
          .order('created_at', ascending: false);

      return (response as List)
          .map((item) => SupplierModel.fromMap(item))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  /// Get suppliers by industry
  Future<List<SupplierModel>> getSuppliersByIndustry(String industry) async {
    try {
      final response = await supabase.client
          .from('suppliers')
          .select()
          .eq('industry', industry)
          .order('created_at', ascending: false);

      return (response as List)
          .map((item) => SupplierModel.fromMap(item))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  /// Get suppliers by interest level
  Future<List<SupplierModel>> getSuppliersByInterestLevel(
    String interestLevel,
  ) async {
    try {
      final response = await supabase.client
          .from('suppliers')
          .select()
          .eq('interest_level', interestLevel)
          .order('created_at', ascending: false);

      return (response as List)
          .map((item) => SupplierModel.fromMap(item))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
