import 'package:get/get_utils/src/get_utils/get_utils.dart';

class AuthValidators {
  AuthValidators._();
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  static String? requiredField(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName cannot be empty';
    }
    return null;
  }

  static String? validatePrice(String? value) {
    value = value?.trim().replaceAll(',', '') ?? '';

    if (value.isEmpty) {
      return 'Price cannot be empty';
    }
    final price = double.tryParse(value);
    if (price == null) {
      return 'Please enter a valid price';
    }
    if (price <= 0) {
      return 'Price must be greater than 0';
    }
    return null;
  }

  static String? validateMOQ(String? value) {
    value = value?.trim().replaceAll(',', '') ?? '';

    if (value.isEmpty) {
      return 'MOQ cannot be empty';
    }
    final moq = int.tryParse(value);
    if (moq == null) {
      return 'Please enter a valid quantity';
    }
    if (moq <= 0) {
      return 'MOQ must be greater than 0';
    }
    return null;
  }

  static String? validateLeadTime(String? value) {
    value = value?.trim().replaceAll(',', '') ?? '';
    if (value.isEmpty) {
      return 'Lead Time cannot be empty';
    }
    final leadTime = int.tryParse(value);
    if (leadTime == null) {
      return 'Please enter a valid number of days';
    }
    if (leadTime < 0) {
      return 'Lead Time cannot be negative';
    }
    return null;
  }
}
