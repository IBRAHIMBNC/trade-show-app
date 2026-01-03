import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/instance_manager.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supplier_snap/app/core/database/app_db.dart';
import 'package:supplier_snap/app/core/services/connectivity_service.dart';
import 'package:supplier_snap/app/core/services/file_picker_service.dart';
import 'package:supplier_snap/app/core/services/global_service.dart';
import 'package:supplier_snap/app/core/services/shared_prefrences_service.dart';
import 'package:supplier_snap/app/core/services/supbase_storage_service.dart';
import 'package:supplier_snap/app/core/services/sync/sync_service.dart';

class InitServices {
  static Future<void> init() async {
    await Get.putAsync<FilePickerService>(() => FilePickerService().init());
    Get.put(AppDatabase());
    Get.put(ConnectivityService(connectivity: Connectivity()));
    Get.lazyPut(
      () => SupbaseStorageService(supabaseClient: Supabase.instance.client),
    );
    Get.lazyPut(() => FilePickerService());

    await Get.putAsync(() => SharedPrefrencesService().init());

    await Get.putAsync<GlobalService>(
      () => GlobalService(supabaseClient: Supabase.instance.client).init(),
    );

    // Initialize SyncService after GlobalService (needs database and connectivity)
    await Get.putAsync<SyncService>(
      () => SyncService(
        database: Get.find<AppDatabase>(),
        supabaseClient: Supabase.instance.client,
        connectivityService: Get.find<ConnectivityService>(),
      ).init(),
    );
  }
}
