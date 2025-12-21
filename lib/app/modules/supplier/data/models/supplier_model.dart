import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:supplier_snap/app/core/database/app_db.dart';
import 'package:supplier_snap/app/core/enums/industry_type_enum.dart';
import 'package:supplier_snap/app/core/enums/interest_level_enum.dart';
import 'package:supplier_snap/app/core/enums/product_type_enum.dart';
import 'package:supplier_snap/app/core/extensions/string.dart';
import 'package:supplier_snap/app/modules/supplier/data/models/scores_model.dart';

class SupplierModel extends Equatable {
  final int? id;
  final String userId; // User who added this supplier
  final String name;
  final String company;
  final String booth;
  final String? address;
  final String? email;
  final String? phone;
  final String? weChatID;
  final String? whatsAppNumber;
  final String? notes;
  final IndustryTypeEnum? industry;
  final InterestLevelEnum? interestLevel;
  final String? imageUrl;
  final String? _imageLocalPath;
  final ScoresModel scores;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final ProductTypeEnum? productType;

  String? get absoluteImagePath => _imageLocalPath?.toAbsolutePath;

  String? get relativeImagePath => _imageLocalPath;

  const SupplierModel({
    this.id,
    required this.userId,
    required this.name,
    required this.company,
    required this.booth,
    this.address,
    this.email,
    this.phone,
    this.weChatID,
    this.whatsAppNumber,
    this.notes,
    this.industry,
    this.interestLevel,
    this.imageUrl,
    String? imageLocalPath,
    this.scores = ScoresModel.emptyScores,
    this.createdAt,
    this.updatedAt,
    this.productType,
  }) : _imageLocalPath = imageLocalPath;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'name': name,
      'company': company,
      'booth': booth,
      'address': address,
      'email': email,
      'phone': phone,
      'we_chat_id': weChatID,
      'whats_app_number': whatsAppNumber,
      'notes': notes,
      'industry': industry?.name,
      'interest_level': interestLevel?.name,
      'image_url': imageUrl,
      'image_local_path': _imageLocalPath,
      'scores': scores.toMap(),
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'product_type': productType?.name,
    };
  }

  // For local database (Drift)
  Map<String, dynamic> toLocalMap() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'company': company,
      'booth': booth,
      'address': address,
      'email': email,
      'phone': phone,
      'weChatID': weChatID,
      'whatsAppNumber': whatsAppNumber,
      'notes': notes,
      'industry': industry?.name,
      'interestLevel': interestLevel?.name,
      'imageUrl': imageUrl,
      'scores': scores.toMap(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'productType': productType?.name,
    };
  }

  factory SupplierModel.fromMap(Map<String, dynamic> map) {
    return SupplierModel(
      id: map['id']?.toInt(),
      userId: map['user_id'] ?? '',
      name: map['name'] ?? '',
      company: map['company'] ?? '',
      booth: map['booth'] ?? '',
      address: map['address'],
      email: map['email'],
      phone: map['phone'],
      weChatID: map['we_chat_id'],
      whatsAppNumber: map['whats_app_number'],
      notes: map['notes'],
      industry: map['industry'],
      interestLevel: map['interest_level'],
      imageUrl: map['image_url'],
      imageLocalPath: map['image_local_path'],
      scores: map['scores'] != null
          ? ScoresModel.fromMap(map['scores'])
          : ScoresModel.emptyScores,
      createdAt: map['created_at'] != null
          ? DateTime.parse(map['created_at'])
          : null,
      updatedAt: map['updated_at'] != null
          ? DateTime.parse(map['updated_at'])
          : null,
      productType: map['productType'] != null
          ? ProductTypeEnum.fromName(map['productType'])
          : null,
    );
  }

  // For local database (Drift)
  factory SupplierModel.fromLocalMap(Map<String, dynamic> map) {
    return SupplierModel(
      id: map['id']?.toInt(),
      userId: map['userId'] ?? '',
      name: map['name'] ?? '',
      company: map['company'] ?? '',
      booth: map['booth'] ?? '',
      address: map['address'],
      email: map['email'],
      phone: map['phone'],
      weChatID: map['weChatID'],
      whatsAppNumber: map['whatsAppNumber'],
      notes: map['notes'],
      industry: map['industry'],
      interestLevel: map['interestLevel'],
      imageUrl: map['imageUrl'],
      scores: map['scores'] != null
          ? ScoresModel.fromMap(map['scores'])
          : ScoresModel.emptyScores,
      createdAt: map['createdAt'] != null
          ? DateTime.parse(map['createdAt'])
          : null,
      updatedAt: map['updatedAt'] != null
          ? DateTime.parse(map['updatedAt'])
          : null,
      productType: map['productType'] != null
          ? ProductTypeEnum.fromName(map['productType'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SupplierModel.fromJson(String source) =>
      SupplierModel.fromMap(json.decode(source));

  SupplierModel copyWith({
    int? id,
    String? userId,
    String? name,
    String? company,
    String? booth,
    String? address,
    String? email,
    String? phone,
    String? weChatID,
    String? whatsAppNumber,
    String? notes,
    IndustryTypeEnum? industry,
    InterestLevelEnum? interestLevel,
    String? imageUrl,
    String? imageLocalPath,
    ScoresModel? scores,
    DateTime? createdAt,
    DateTime? updatedAt,
    ProductTypeEnum? productType,
  }) {
    return SupplierModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      company: company ?? this.company,
      booth: booth ?? this.booth,
      address: address ?? this.address,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      weChatID: weChatID ?? this.weChatID,
      whatsAppNumber: whatsAppNumber ?? this.whatsAppNumber,
      notes: notes ?? this.notes,
      industry: industry ?? this.industry,
      interestLevel: interestLevel ?? this.interestLevel,
      imageUrl: imageUrl ?? this.imageUrl,
      imageLocalPath: imageLocalPath ?? _imageLocalPath,
      scores: scores ?? this.scores,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      productType: productType ?? this.productType,
    );
  }

  factory SupplierModel.fromDatabaseModel(SupplierData data) {
    return SupplierModel(
      id: data.id,
      userId: data.userId,
      name: data.name,
      company: data.company,
      booth: data.booth,
      address: data.address,
      email: data.email,
      phone: data.phone,
      weChatID: data.weChatID,
      whatsAppNumber: data.whatsAppNumber,
      notes: data.notes,
      industry: IndustryTypeEnum.fromString(data.industry),
      interestLevel: InterestLevelEnum.fromString(data.interestLevel),
      imageUrl: data.imageUrl,
      imageLocalPath: data.imageLocalPath,
      scores: ScoresModel.fromMap(data.scores ?? {}),
      createdAt: data.createdAt != null
          ? DateTime.parse(data.createdAt!)
          : null,
      updatedAt: data.updatedAt != null
          ? DateTime.parse(data.updatedAt!)
          : null,
      productType: ProductTypeEnum.fromName(data.productType ?? ''),
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      name,
      company,
      booth,
      address,
      email,
      phone,
      weChatID,
      whatsAppNumber,
      notes,
      industry,
      interestLevel,
      imageUrl,
      _imageLocalPath,
      scores,
      createdAt,
      updatedAt,
      productType,
    ];
  }
}
