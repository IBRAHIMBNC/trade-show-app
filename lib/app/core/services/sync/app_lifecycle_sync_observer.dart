import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/core/services/sync/sync_service.dart';

/// Observes app lifecycle changes and triggers sync on resume
class AppLifecycleSyncObserver extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      // App came back to foreground
      _onAppResumed();
    }
  }

  void _onAppResumed() {
    try {
      final syncService = Get.find<SyncService>();
      syncService.onAppResumed();
    } catch (e) {
      // SyncService not yet registered, ignore
    }
  }

  /// Register this observer with WidgetsBinding
  void register() {
    WidgetsBinding.instance.addObserver(this);
  }

  /// Unregister this observer from WidgetsBinding
  void unregister() {
    WidgetsBinding.instance.removeObserver(this);
  }
}
