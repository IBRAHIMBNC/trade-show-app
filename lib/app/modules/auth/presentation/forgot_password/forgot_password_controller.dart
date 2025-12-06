import 'package:flutter/src/widgets/editable_text.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  //TODO: Implement ForgotPasswordController

  final count = 0.obs;

  TextEditingController? get emailController => null;

  void increment() => count.value++;

  changePassword() {}
}
