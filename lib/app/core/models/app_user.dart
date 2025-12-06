// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:gotrue/src/types/auth_response.dart';

class AppUser {
  String id;
  String name;
  String email;

  AppUser({required this.id, required this.name, required this.email});

  static AppUser fromAuthResponse(AuthResponse response) {
    return AppUser(
      id: response.user!.id,
      name: response.user!.userMetadata?['full_name'] ?? '',
      email: response.user!.email!,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'full_name': name, 'email': email};
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map['id'] as String,
      name: map['full_name'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source) as Map<String, dynamic>);
}
