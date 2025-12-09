import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'f_a_qs_controller.dart';

class FAQsView extends GetView<FAQsController> {
  const FAQsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FAQsView'), centerTitle: true),
      body: const Center(
        child: Text('FAQsView is working', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
