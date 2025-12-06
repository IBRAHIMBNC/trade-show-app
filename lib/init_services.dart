import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/instance_manager.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supplier_snap/app/core/services/connectivity_service.dart';
import 'package:supplier_snap/app/core/services/global_service.dart';
import 'package:supplier_snap/app/core/services/shared_prefrences_service.dart';

class InitServices {
  static Future<void> init() async {
    Get.lazyPut(() => ConnectivityService(connectivity: Connectivity()));

    await Get.putAsync(() => SharedPrefrencesService().init());

    await Get.putAsync<GlobalService>(
      () => GlobalService(supabaseClient: Supabase.instance.client).init(),
    );
  }
}
