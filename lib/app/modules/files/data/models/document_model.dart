import 'dart:convert';

import 'package:supplier_snap/app/core/database/app_db.dart';
import 'package:supplier_snap/app/core/enums/file_type_enum.dart';
import 'package:supplier_snap/app/core/extensions/string.dart';

class DocumentModel {
  final int? id;
  final String title;
  final String localPath;
  final String? url;
  final DocumentType type;
  final DateTime? createdAt;
  final int supplierId;

  String get absolutePath => localPath.toAbsolutePath;

  const DocumentModel({
    this.id,
    required this.title,
    required this.localPath,
    this.url,
    required this.type,
    this.createdAt,
    required this.supplierId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'local_path': localPath,
      'url': url,
      'type': type,
      'created_at': createdAt?.toIso8601String(),
      'supplier_id': supplierId,
    };
  }

  factory DocumentModel.fromMap(Map<String, dynamic> map) {
    return DocumentModel(
      id: map['id']?.toInt(),
      title: map['title'] ?? '',
      localPath: map['local_path'] ?? '',
      url: map['url'],
      type: map['type'] ?? '',
      createdAt: map['created_at'] != null
          ? DateTime.parse(map['created_at'])
          : null,
      supplierId: map['supplier_id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory DocumentModel.fromJson(String source) =>
      DocumentModel.fromMap(json.decode(source));

  DocumentModel copyWith({
    int? id,
    String? title,
    String? localPath,
    String? url,
    DocumentType? type,
    DateTime? createdAt,
    int? supplierId,
  }) {
    return DocumentModel(
      id: id ?? this.id,
      title: title ?? this.title,
      localPath: localPath ?? this.localPath,
      url: url ?? this.url,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      supplierId: supplierId ?? this.supplierId,
    );
  }

  factory DocumentModel.fromDatabaseModel(DocumentTableData data) {
    return DocumentModel(
      id: data.id,
      title: data.title,
      localPath: data.localPath,
      url: data.url,
      type: DocumentType.fromString(data.type) ?? DocumentType.unknown,
      createdAt: data.createdAt,
      supplierId: data.supplierId!,
    );
  }
}
