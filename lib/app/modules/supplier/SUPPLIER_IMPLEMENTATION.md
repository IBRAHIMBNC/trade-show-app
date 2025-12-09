# Supplier Module Implementation (Local-Only)

## Overview
This module implements a complete supplier management system with **multi-user access** support using **local SQLite database only**. All suppliers are stored locally, and syncing with remote servers can be added later.

## Key Features
✅ **Multi-User Access** - All users can view suppliers added by any user (local multi-user support)
✅ **Local Storage** - Full CRUD operations using Drift (SQLite) database
✅ **User Attribution** - Each supplier tracks who added it via `userId` field
✅ **Search & Filter** - Search by name/company
✅ **No Network Required** - Everything works offline, perfect for trade shows with poor connectivity

## Architecture

### Data Layer Structure
```
lib/app/modules/supplier/data/
├── models/
│   └── supplier_model.dart           # Supplier entity model
├── datasources/
│   ├── supplier_local_datasource.dart  # Drift (SQLite) operations
│   └── supplier_remote_datasource.dart # (Reserved for future sync)
└── repository/
    └── supplier_repository.dart       # Repository pattern (local-only)
```

## Database Schema

### Local Database (Drift/SQLite)
The local SQLite database is the primary and only storage. Schema is defined in `supplier_table.dart`:

```dart
class Supplier extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId => text(); // User who added this supplier
  TextColumn get name => text();
  TextColumn get company => text();
  TextColumn get booth => text();
  TextColumn get address => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get weChatID => text().nullable()();
  TextColumn get whatsAppNumber => text().nullable()();
  TextColumn get notes => text().nullable()();
  TextColumn get industry => text().nullable()();
  TextColumn get interestLevel => text().nullable()();
  TextColumn get imageUrl => text().nullable()();
  IntColumn get score => integer().nullable()();
  TextColumn get createdAt => text().nullable()();
  TextColumn get updatedAt => text().nullable()();
}
```

### Future: Remote Sync (Supabase)
When ready to add syncing, you can use the SQL script in `supabase_setup.sql` to create the remote table with the same schema.

## Multi-User Access Explanation

### How It Works (Local-Only)
1. **Creation**: When a user creates a supplier, the `userId` field is automatically set to their user ID
2. **Viewing**: The `getAllSuppliers()` method retrieves ALL suppliers from local database regardless of who added them
3. **Attribution**: Each supplier shows who added it via the `userId` field
4. **Local Sharing**: All users on the same device can see all suppliers (device-level multi-user)

### Example Use Cases
- **Trade Show Scenario**: Multiple team members using the same device can add and view all suppliers
- **Local Collaboration**: Perfect for offline environments where network isn't reliable
- **Later Sync**: All this data can be synced to cloud later when you implement remote sync

## Usage Examples

### 1. Setup Repository in Binding

```dart
class AddSupplierBinding extends Bindings {
  @override
  void dependencies() {
    // Only local datasource needed
    Get.lazyPut(() => SupplierLocalDatasource(database: Get.find()));
    Get.lazyPut(
      () => SupplierRepository(
        localSource: Get.find(),
        connectivityService: Get.find(),
      ),
    );
    Get.lazyPut<AddSupplierController>(() => AddSupplierController());
  }
}
```

### 2. Create a Supplier

```dart
final supplier = SupplierModel(
  userId: '', // Automatically set by repository
  name: 'John Doe',
  company: 'ABC Trading Co.',
  booth: 'A-101',
  email: 'john@abctrading.com',
  phone: '+1234567890',
  industry: 'Electronics',
  interestLevel: 'High',
);

final result = await supplierRepository.createSupplier(supplier);
result.fold(
  (failure) => print('Error: ${failure.message}'),
  (supplier) => print('Created supplier: ${supplier.name}'),
);
```

### 3. Get All Suppliers (Multi-User)

```dart
final result = await supplierRepository.getAllSuppliers();
result.fold(
  (failure) => print('Error: ${failure.message}'),
  (suppliers) {
    for (final supplier in suppliers) {
      print('${supplier.name} - Added by: ${supplier.userId}');
    }
  },
);
```

### 4. Get Only My Suppliers

```dart
final result = await supplierRepository.getMySuppliers();
result.fold(
  (failure) => print('Error: ${failure.message}'),
  (mySuppliers) => print('I added ${mySuppliers.length} suppliers'),
);
```

### 5. Search Suppliers

```dart
final result = await supplierRepository.searchSuppliers('Electronics');
result.fold(
  (failure) => print('Error: ${failure.message}'),
  (suppliers) => print('Found ${suppliers.length} electronics suppliers'),
);
```

### 6. Update a Supplier

```dart
final updatedSupplier = existingSupplier.copyWith(
  email: 'newemail@company.com',
  interestLevel: 'Very High',
);

final result = await supplierRepository.updateSupplier(
  existingSupplier.id!,
  updatedSupplier,
);
```

### 7. Clear All Suppliers (for testing/reset)

```dart
final result = await supplierRepository.clearAllSuppliers();
result.fold(
  (failure) => print('Error: ${failure.message}'),
  (_) => print('All suppliers cleared'),
);
```

## Current Behavior (Local-Only)

### All Operations Work Locally:
- ✅ Create suppliers (saved to local SQLite)
- ✅ View all suppliers (from local database)
- ✅ View my suppliers (filter by current userId)
- ✅ Search suppliers (local search)
- ✅ Update suppliers (updates local database)
- ✅ Delete suppliers (removes from local database)
- ✅ **No network required** - Everything works offline

### Future: Adding Remote Sync
When you're ready to add cloud sync:
1. Implement `SupplierRemoteDatasource` methods
2. Update repository to sync local ↔ remote
3. Use the provided `supabase_setup.sql` for backend setup

## Error Handling

The repository uses the `Either` type from `dartz` for functional error handling:

```dart
final result = await supplierRepository.createSupplier(supplier);
result.fold(
  (failure) {
    if (failure is NetworkFailure) {
      showSnackbar('No internet connection');
    } else if (failure is ServerFailure) {
      showSnackbar('Server error: ${failure.message}');
    }
  },
  (supplier) {
    showSnackbar('Supplier created: ${supplier.name}');
  },
);
```

## Testing Checklist

### Database Setup
- [x] Schema defined in `supplier_table.dart`
- [x] Database schema version updated to 2
- [x] Run `dart run build_runner build` to generate Drift code ✅

### Functionality Testing
- [ ] Create supplier (local)
- [ ] View all suppliers
- [ ] View only my suppliers
- [ ] Search suppliers
- [ ] Update supplier
- [ ] Delete supplier
- [ ] Test with multiple users on same device

## Next Steps

1. **Integrate with UI**:
   - Update `AddSupplierController` to use repository
   - Update `HomeController` to fetch and display suppliers

2. **Example Binding** (`add_supplier_binding.dart`):
   ```dart
   Get.lazyPut(() => SupplierLocalDatasource(database: Get.find()));
   Get.lazyPut(() => SupplierRepository(
     localSource: Get.find(),
     connectivityService: Get.find(),
   ));
   ```

3. **Future: Add Remote Sync** when ready

4. **Add Image Upload**: Use local storage or cloud later

## Important Notes

⚠️ **Current State**: 
- ✅ All operations are **local-only** (SQLite)
- ✅ No network required
- ✅ Multi-user at device level
- 📦 Remote sync ready later
