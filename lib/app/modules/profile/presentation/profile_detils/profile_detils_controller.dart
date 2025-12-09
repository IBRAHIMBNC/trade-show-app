import 'package:get/get.dart';
import 'package:supplier_snap/app/core/models/app_user.dart';
import 'package:supplier_snap/app/core/services/global_service.dart';
import 'package:supplier_snap/app/modules/profile/data/repository/profile_repository.dart';
import 'package:supplier_snap/app/routes/app_pages.dart';
import 'package:supplier_snap/app/utils/loading_overlay.dart';
import 'package:supplier_snap/app/utils/snackbars.dart';

class ProfileDetilsController extends GetxController {
  final globalService = Get.find<GlobalService>();
  final ProfileRepository profileRepository;

  ProfileDetilsController({required this.profileRepository});

  RxBool isLoading = false.obs;

  AppUser? get currentUser => globalService.currentUser.value;

  goToEditPofile() {
    Get.toNamed(Routes.EDIT_PROFILE);
  }

  goToChangePassword() {
    Get.toNamed(Routes.CHANGE_PASSWORD);
  }

  goToDeleteAccount() {
    Get.toNamed(Routes.DELETE_ACCOUNT);
  }

  signOut() async {
    isAppLoading = true;
    final result = await profileRepository.signOut();
    result.fold(
      (failure) {
        isAppLoading = false;
      },
      (_) {
        Get.offAllNamed(Routes.LOGIN);
        isAppLoading = false;
      },
    );
  }

  init() {
    isLoading.value = true;
    profileRepository.getProfile().then((result) {
      result.fold(
        (failure) {
          isLoading.value = false;
          showErrorSnackbar(message: failure.message);
        },
        (user) {
          globalService.setUser(user);
          isLoading.value = false;
        },
      );
    });
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}
