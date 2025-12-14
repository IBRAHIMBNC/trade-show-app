import 'dart:convert';

import 'package:supplier_snap/app/core/database/app_db.dart';
import 'package:supplier_snap/app/core/enums/product_category_enum.dart';
import 'package:supplier_snap/app/core/extensions/string.dart';

class ProductModel {
  final int? id;
  final String name;
  final double price;
  final String? specifications;
  final String? notes;
  final DateTime? createdAt;
  final ProductCategoryEnum category;
  final int? leadTimeDays;
  final int supplierId;
  final int? moq;
  final String? moqUnit;
  final List<String> _imageLocalPaths;
  final List<String> imageUrls;
  final String? certifications;

  List<String> get absoluteImagePaths =>
      _imageLocalPaths.map((e) => e.toAbsolutePath).toList();

  List<String> get relativeImagePaths => _imageLocalPaths;

  const ProductModel({
    this.id,
    required this.name,
    required this.price,
    this.specifications,
    this.notes,
    this.createdAt,
    required this.category,
    this.leadTimeDays,
    required this.supplierId,
    this.moq,
    this.moqUnit,
    List<String> imageLocalPaths = const [],
    this.imageUrls = const [],
    this.certifications,
  }) : _imageLocalPaths = imageLocalPaths;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'specifications': specifications,
      'notes': notes,
      'created_at': createdAt?.toIso8601String(),
      'category': category,
      'lead_time_days': leadTimeDays,
      'supplier_id': supplierId,
      'moq': moq,
      'moq_unit': moqUnit,
      'image_local_paths': _imageLocalPaths,
      'image_urls': imageUrls,
      'certifications': certifications,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id']?.toInt(),
      name: map['name'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      specifications: map['specifications'],
      notes: map['notes'],
      createdAt: map['created_at'] != null
          ? DateTime.parse(map['created_at'])
          : null,
      category: map['category'],
      leadTimeDays: map['lead_time_days']?.toInt(),
      supplierId: map['supplier_id']?.toInt() ?? 0,
      moq: map['moq']?.toInt(),
      moqUnit: map['moq_unit'],
      imageLocalPaths: map['image_local_paths'] != null
          ? List<String>.from(map['image_local_paths'])
          : [],
      imageUrls: map['image_urls'] != null
          ? List<String>.from(map['image_urls'])
          : [],
      certifications: map['certifications'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  ProductModel copyWith({
    int? id,
    String? name,
    double? price,
    String? specifications,
    String? notes,
    DateTime? createdAt,
    ProductCategoryEnum? category,
    int? leadTimeDays,
    int? supplierId,
    int? moq,
    String? moqUnit,
    List<String>? imageLocalPaths,
    List<String>? imageUrls,
    String? certifications,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      specifications: specifications ?? this.specifications,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      category: category ?? this.category,
      leadTimeDays: leadTimeDays ?? this.leadTimeDays,
      supplierId: supplierId ?? this.supplierId,
      moq: moq ?? this.moq,
      moqUnit: moqUnit ?? this.moqUnit,
      imageUrls: imageUrls ?? this.imageUrls,
      certifications: certifications ?? this.certifications,
      imageLocalPaths: imageLocalPaths ?? _imageLocalPaths,
    );
  }

  factory ProductModel.fromDatabaseModel(ProductTableData data) {
    return ProductModel(
      id: data.id,
      name: data.name,
      price: data.price,
      specifications: data.specifications,
      notes: data.notes,
      createdAt: data.createdAt,
      category: ProductCategoryEnum.fromName(data.category ?? ''),
      leadTimeDays: data.leadTimeDays,
      supplierId: data.supplierId!,
      moq: data.moq,
      moqUnit: data.moqUnit,
      imageLocalPaths: data.imageLocalPaths ?? [],
      imageUrls: data.imageUrls ?? [],
      certifications: data.certifications,
    );
  }
}
