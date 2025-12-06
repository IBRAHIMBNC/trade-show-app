import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/modules/home/home_view.dart';

class NavigationController extends GetxController {
  final currentIndex = 0.obs;
  final pageController = PageController(initialPage: 0);
  final List<Widget> pages = [
    HomeView(),
    Container(color: Colors.green),
    Container(color: Colors.blue),
  ];

  onTabChanged(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    currentIndex.value = index;
  }
}
