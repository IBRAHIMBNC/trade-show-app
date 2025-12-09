import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileRemoteDatasource {
  final supabase = Supabase.instance;

  Future<Map<String, dynamic>> getProfile() async {
    final userId = supabase.client.auth.currentUser?.id;
    if (userId == null) {
      throw Exception('User not logged in');
    }
    try {
      final response = await supabase.client
          .from('profiles')
          .select()
          .eq('id', userId)
          .single();

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateProfile(Map<String, dynamic> data) async {
    final userId = supabase.client.auth.currentUser?.id;
    if (userId == null) {
      throw Exception('User not logged in');
    }
    try {
      await supabase.client.from('profiles').update(data).eq('id', userId);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logOut() async {
    try {
      await supabase.client.auth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  // Future<void> changePassword(String newPassword) async {
  //   try {
  //     await supabase.client.auth.updateUser(
  //       UserAttributes(password: newPassword),
  //     );
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
