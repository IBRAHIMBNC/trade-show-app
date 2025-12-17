import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/core/models/app_user.dart';
import 'package:supplier_snap/app/core/services/file_picker_service.dart';
import 'package:supplier_snap/app/core/services/global_service.dart';
import 'package:supplier_snap/app/modules/profile/data/repository/profile_repository.dart';
import 'package:supplier_snap/app/utils/loading_overlay.dart';
import 'package:supplier_snap/app/utils/snackbars.dart';

class EditProfileController extends GetxController {
  final ProfileRepository profileRepository;
  final globalService = Get.find<GlobalService>();

  EditProfileController({required this.profileRepository});

  String name = '';

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final Rxn<File> selectedImage = Rxn<File>();

  String? imageUrl;

  init() {
    nameController.text = globalService.currentUser.value?.name ?? '';
    emailController.text = globalService.currentUser.value?.email ?? '';
    imageUrl = globalService.currentUser.value?.imageUrl;
  }

  pickImage() {
    final filePickerService = Get.find<FilePickerService>();
    isAppLoading = true;
    filePickerService.pickImageFromGallery().then((file) {
      if (file != null) {
        selectedImage.value = file;
      }
      isAppLoading = false;
    });
  }

  saveChanges() async {
    FocusManager.instance.primaryFocus?.unfocus();
    isAppLoading = true;
    final image = await uploadProfileImage();
    final updatedUser = globalService.currentUser.value!.copyWith(
      name: nameController.text.trim(),
      imageUrl: image,
    );

    final result = await profileRepository.updateProfile(updatedUser);
    result.fold(
      (failure) {
        isAppLoading = false;
        showErrorSnackbar(message: failure.message);
      },
      (updatedUser) {
        globalService.setUser(updatedUser);
        isAppLoading = false;
        showSuccessSnackbar(message: "Profile updated successfully");
      },
    );
  }

  Future<String?> uploadProfileImage() async {
    if (selectedImage.value == null) return null;
    final newFileName = 'profile_${DateTime.now().millisecond}.jpg';
    final oldFileName = globalService.currentUser.value?.imagePath
        ?.split('/')
        .last;
    final result = await profileRepository.uploadProfileImage(
      selectedImage.value!,
      newFileName,
      oldFileName,
    );

    String? imageUrl;
    result.fold((failure) {}, (url) {
      imageUrl = url;
    });
    return imageUrl;
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}
