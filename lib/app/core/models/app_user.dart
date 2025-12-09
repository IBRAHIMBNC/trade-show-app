// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supplier_snap/app/utils/my_utils.dart';

class AppUser {
  final String id;
  final String name;
  final String email;
  final String _createdAt;
  final String? imagePath;

  const AppUser({
    required this.id,
    required this.name,
    required this.email,
    required String createdAt,
    this.imagePath,
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
      'image_path': imagePath,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map['id'] as String,
      name: map['full_name'] as String,
      email: map['email'] as String,
      createdAt: map['created_at'] as String,
      imagePath: map['image_path'] as String?,
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
      imagePath: imageUrl ?? imagePath,
    );
  }

  @override
  String toString() {
    return 'AppUser(id: $id, name: $name, email: $email, createdAt: $_createdAt)';
  }
}

extension AppUserExtension on AppUser {
  DateTime get createdDateTime => DateTime.parse(_createdAt);

  String? get imageUrl =>
      imagePath == null ? null : MyUtils.getPublicUrl(imagePath!);
}
