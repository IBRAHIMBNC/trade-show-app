import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supplier_snap/app/core/models/app_user.dart';

class AuthRemoteDatasource {
  final supabase = Supabase.instance;

  Future<AuthResponse> signUp(
    String email,
    String password,
    Map<String, dynamic> metaData,
  ) async {
    try {
      final response = await supabase.client.auth.signUp(
        email: email,
        password: password,
        data: metaData,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthResponse> signIn(String email, String password) async {
    try {
      final response = await supabase.client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<AppUser> getUserProfile(String userId) async {
    try {
      final response = await supabase.client
          .from('profiles')
          .select()
          .eq('id', userId)
          .single();

      return AppUser.fromMap(response);
    } catch (e) {
      rethrow;
    }
  }
}
