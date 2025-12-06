import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GlobalService extends GetxService {
  final SupabaseClient supabaseClient;
  GlobalService({required this.supabaseClient});

  Future<GlobalService> init() async {
    return this;
  }

  bool get isUserLoggedIn => supabaseClient.auth.currentUser != null;
}
