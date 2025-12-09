// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:supabase_flutter/supabase_flutter.dart';

class AppUser {
  String id;
  String name;
  String email;
  String _createdAt;
  String? imageUrl;

  AppUser({
    required this.id,
    required this.name,
    required this.email,
    required String createdAt,
    this.imageUrl,
  }) : _createdAt = createdAt;

  static AppUser fromAuthResponse(AuthResponse response) {
    return AppUser(
      id: response.user!.id,
      name: response.user!.userMetadata?['full_name'] ?? '',
      email: response.user!.email!,
      createdAt: response.user!.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'full_name': name,
      'email': email,
      'created_at': _createdAt,
      'image_url': imageUrl,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map['id'] as String,
      name: map['full_name'] as String,
      email: map['email'] as String,
      createdAt: map['created_at'] as String,
      imageUrl: map['image_url'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source) as Map<String, dynamic>);

  AppUser copyWith({
    String? id,
    String? name,
    String? email,
    String? createdAt,
    String? imageUrl,
  }) {
    return AppUser(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      createdAt: createdAt ?? _createdAt,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  String toString() {
    return 'AppUser(id: $id, name: $name, email: $email, createdAt: $_createdAt)';
  }
}

extension AppUserExtension on AppUser {
  DateTime get createdDateTime => DateTime.parse(_createdAt);
}
