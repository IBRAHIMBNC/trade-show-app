import 'dart:convert';

import 'package:flutter/material.dart';

extension PrettyMap on Map<String, dynamic> {
  String get prettyPrint {
    try {
      final convertor = JsonEncoder.withIndent('  ');
      final prettyString = convertor.convert(this);
      return prettyString;
    } catch (e) {
      debugPrint('Error converting map to pretty string: $e');
      // If conversion fails, return an empty string or handle the error as needed
      return '';
    }
  }
}
