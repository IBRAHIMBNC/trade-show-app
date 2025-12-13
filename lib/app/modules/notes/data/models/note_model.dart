import 'dart:convert';

import 'package:supplier_snap/app/core/database/app_db.dart';

class NoteModel {
  final int? id;
  final String title;
  final String content;
  final DateTime? createdAt;
  final int supplierId;

  const NoteModel({
    this.id,
    required this.title,
    required this.content,
    this.createdAt,
    required this.supplierId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'created_at': createdAt?.toIso8601String(),
      'supplier_id': supplierId,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map['id']?.toInt(),
      title: map['title'] ?? '',
      content: map['content'] ?? '',
      createdAt: map['created_at'] != null
          ? DateTime.parse(map['created_at'])
          : null,
      supplierId: map['supplier_id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory NoteModel.fromJson(String source) =>
      NoteModel.fromMap(json.decode(source));

  NoteModel copyWith({
    int? id,
    String? title,
    String? content,
    DateTime? createdAt,
    int? supplierId,
  }) {
    return NoteModel(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      supplierId: supplierId ?? this.supplierId,
    );
  }

  factory NoteModel.fromDatabaseModel(NotesTableData data) {
    return NoteModel(
      id: data.id,
      title: data.title,
      content: data.content,
      createdAt: data.createdAt,
      supplierId: data.supplierId!,
    );
  }
}
