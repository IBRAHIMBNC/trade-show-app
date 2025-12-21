// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ScoresModel extends Equatable {
  final int cost;
  final int quality;
  final int leadTime;
  final int certifications;
  final int fit;

  const ScoresModel({
    required this.cost,
    required this.quality,
    required this.leadTime,
    required this.certifications,
    required this.fit,
  });

  int get total {
    return cost + quality + leadTime + certifications + fit;
  }

  static const ScoresModel emptyScores = ScoresModel(
    cost: 0,
    quality: 0,
    leadTime: 0,
    certifications: 0,
    fit: 0,
  );

  Map<String, String> toMap() {
    final map = {
      'cost': cost,
      'quality': quality,
      'leadTime': leadTime,
      'certifications': certifications,
      'fit': fit,
    };
    return map.map((key, value) => MapEntry(key, value.toString()));
  }

  factory ScoresModel.fromMap(Map<String, dynamic> map) {
    final parsedMap = map.map(
      (key, value) => MapEntry(key, int.tryParse(value.toString()) ?? 0),
    );
    return ScoresModel(
      cost: parsedMap['cost'] ?? 0,
      quality: parsedMap['quality'] ?? 0,
      leadTime: parsedMap['leadTime'] ?? 0,
      certifications: parsedMap['certifications'] ?? 0,
      fit: parsedMap['fit'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ScoresModel.fromJson(String source) =>
      ScoresModel.fromMap(json.decode(source) as Map<String, dynamic>);

  ScoresModel copyWith({
    int? cost,
    int? quality,
    int? leadTime,
    int? certifications,
    int? fit,
  }) {
    return ScoresModel(
      cost: cost ?? this.cost,
      quality: quality ?? this.quality,
      leadTime: leadTime ?? this.leadTime,
      certifications: certifications ?? this.certifications,
      fit: fit ?? this.fit,
    );
  }

  @override
  List<Object> get props => [cost, quality, leadTime, certifications, fit];
}
