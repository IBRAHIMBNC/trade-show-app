// import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  AuthService._();

  static final AuthService instance = AuthService._();

  final _supabase = Supabase.instance.client;

  User? get currentUser => _supabase.auth.currentUser;

  bool get isUserLoggedIn => currentUser != null;
}
