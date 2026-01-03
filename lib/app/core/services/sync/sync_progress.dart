/// Represents the current state of sync operations
enum SyncStatus { idle, syncing, completed, error }

/// Model to track sync progress across all tables
class SyncProgress {
  final SyncStatus status;
  final String? currentTable;
  final int currentItem;
  final int totalItems;
  final String? errorMessage;
  final DateTime? lastSyncTime;

  const SyncProgress({
    this.status = SyncStatus.idle,
    this.currentTable,
    this.currentItem = 0,
    this.totalItems = 0,
    this.errorMessage,
    this.lastSyncTime,
  });

  /// Progress percentage (0.0 to 1.0)
  double get percentage {
    if (totalItems == 0) return 0.0;
    return currentItem / totalItems;
  }

  /// Formatted progress string for UI display
  String get progressText {
    if (status == SyncStatus.idle) return 'Ready to sync';
    if (status == SyncStatus.completed) return 'Sync complete';
    if (status == SyncStatus.error) return errorMessage ?? 'Sync error';
    if (currentTable == null) return 'Preparing...';
    return 'Syncing $currentTable ($currentItem/$totalItems)';
  }

  /// Check if currently syncing
  bool get isSyncing => status == SyncStatus.syncing;

  /// Create a copy with updated values
  SyncProgress copyWith({
    SyncStatus? status,
    String? currentTable,
    int? currentItem,
    int? totalItems,
    String? errorMessage,
    DateTime? lastSyncTime,
  }) {
    return SyncProgress(
      status: status ?? this.status,
      currentTable: currentTable ?? this.currentTable,
      currentItem: currentItem ?? this.currentItem,
      totalItems: totalItems ?? this.totalItems,
      errorMessage: errorMessage ?? this.errorMessage,
      lastSyncTime: lastSyncTime ?? this.lastSyncTime,
    );
  }

  /// Factory for starting sync
  factory SyncProgress.syncing({
    required String table,
    int current = 0,
    int total = 0,
  }) {
    return SyncProgress(
      status: SyncStatus.syncing,
      currentTable: table,
      currentItem: current,
      totalItems: total,
    );
  }

  /// Factory for completed state
  factory SyncProgress.completed() {
    return SyncProgress(
      status: SyncStatus.completed,
      lastSyncTime: DateTime.now(),
    );
  }

  /// Factory for error state
  factory SyncProgress.error(String message) {
    return SyncProgress(status: SyncStatus.error, errorMessage: message);
  }

  /// Factory for idle state
  factory SyncProgress.idle() {
    return const SyncProgress(status: SyncStatus.idle);
  }

  @override
  String toString() {
    return 'SyncProgress(status: $status, table: $currentTable, progress: $currentItem/$totalItems)';
  }
}
