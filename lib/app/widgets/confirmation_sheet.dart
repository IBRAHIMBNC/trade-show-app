import 'package:flutter/material.dart';
import 'package:supplier_snap/app/widgets/my_container.dart';

class ConfirmationSheet extends StatelessWidget {
  const ConfirmationSheet({
    super.key,
    this.message,
    required this.title,
    this.imagePath,
  });

  final String? message;
  final String title;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return MyContainer();
  }
}
