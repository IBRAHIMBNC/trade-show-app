import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'comparison_controller.dart';

class ComparisonView extends GetView<ComparisonController> {
  const ComparisonView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ComparisonView'), centerTitle: true),
    );
  }
}
