import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/core/services/sync/sync_progress.dart';
import 'package:supplier_snap/app/core/services/sync/sync_service.dart';
import 'package:supplier_snap/app/modules/comparison/presentation/start_compare_screen.dart';
import 'package:supplier_snap/app/modules/profile/presentation/profile_detils/profile_detils_view.dart';
import 'package:supplier_snap/app/modules/supplier/presentation/home/home_view.dart';

class NavigationController extends GetxController {
  final currentIndex = 0.obs;
  final pageController = PageController(initialPage: 0);

  // Sync progress from SyncService
  Rx<SyncProgress> get syncProgress => Get.find<SyncService>().progress;

  // Convenience getters for UI
  bool get isSyncing => syncProgress.value.isSyncing;
  String get syncProgressText => syncProgress.value.progressText;
  double get syncPercentage => syncProgress.value.percentage;

  final List<Widget> pages = [
    HomeView(),
    StartCompareScreen(),
    ProfileDetilsView(),
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
