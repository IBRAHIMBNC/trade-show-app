import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class ConnectivityService extends GetxService {
  final Connectivity connectivity;

  ConnectivityService({required this.connectivity});

  RxBool isOnline = true.obs;

  Stream<bool> get connectivityStream =>
      connectivity.onConnectivityChanged.map((result) {
        final online = !result.contains(ConnectivityResult.none);
        isOnline.value = online;
        return online;
      });

  @override
  void onInit() {
    isOnline.bindStream(connectivityStream);
    super.onInit();
  }
}
