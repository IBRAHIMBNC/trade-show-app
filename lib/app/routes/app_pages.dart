import 'package:get/get.dart';

import '../modules/auth/presentation/forgot_password/forgot_password_binding.dart';
import '../modules/auth/presentation/forgot_password/forgot_password_view.dart';
import '../modules/auth/presentation/login/login_binding.dart';
import '../modules/auth/presentation/login/login_view.dart';
import '../modules/auth/presentation/sign_up/sign_up_binding.dart';
import '../modules/auth/presentation/sign_up/sign_up_view.dart';
import '../modules/files_listing/files_listing_binding.dart';
import '../modules/files_listing/files_listing_view.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';
import '../modules/navigation/navigation_binding.dart';
import '../modules/navigation/navigation_view.dart';
import '../modules/notes/note_details/note_details_binding.dart';
import '../modules/notes/note_details/note_details_view.dart';
import '../modules/notes/notes_listing/notes_listing_binding.dart';
import '../modules/notes/notes_listing/notes_listing_view.dart';
import '../modules/products/presentation/add_product/add_product_binding.dart';
import '../modules/products/presentation/add_product/add_product_view.dart';
import '../modules/products/presentation/product_details/product_details_binding.dart';
import '../modules/products/presentation/product_details/product_details_view.dart';
import '../modules/products/presentation/product_listing/product_listing_binding.dart';
import '../modules/products/presentation/product_listing/product_listing_view.dart';
import '../modules/profile/presentation/FAQs/f_a_qs_binding.dart';
import '../modules/profile/presentation/FAQs/f_a_qs_view.dart';
import '../modules/profile/presentation/change_password/change_password_binding.dart';
import '../modules/profile/presentation/change_password/change_password_view.dart';
import '../modules/profile/presentation/delete_account/delete_account_binding.dart';
import '../modules/profile/presentation/delete_account/delete_account_view.dart';
import '../modules/profile/presentation/edit_profile/edit_profile_binding.dart';
import '../modules/profile/presentation/edit_profile/edit_profile_view.dart';
import '../modules/profile/presentation/profile_detils/profile_detils_binding.dart';
import '../modules/profile/presentation/profile_detils/profile_detils_view.dart';
import '../modules/splash_screen/splash_screen_binding.dart';
import '../modules/splash_screen/splash_screen_view.dart';
import '../modules/supplier/add_supplier/add_supplier_binding.dart';
import '../modules/supplier/add_supplier/add_supplier_view.dart';
import '../modules/supplier/supplier_detail/supplier_detail_binding.dart';
import '../modules/supplier/supplier_detail/supplier_detail_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.NAVIGATION,
      page: () => const NavigationView(),
      bindings: [NavigationBinding(), HomeBinding(), ProfileDetilsBinding()],
    ),
    GetPage(
      name: _Paths.SUPPLIER_DETAIL,
      page: () => const SupplierDetailView(),
      binding: SupplierDetailBinding(),
    ),
    GetPage(
      name: _Paths.ADD_SUPPLIER,
      page: () => AddSupplierView(),
      binding: AddSupplierBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PRODUCT,
      page: () => const AddProductView(),
      binding: AddProductBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAILS,
      page: () => const ProductDetailsView(),
      binding: ProductDetailsBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_LISTING,
      page: () => const ProductListingView(),
      binding: ProductListingBinding(),
    ),
    GetPage(
      name: _Paths.NOTES_LISTING,
      page: () => const NotesListingView(),
      binding: NotesListingBinding(),
    ),
    GetPage(
      name: _Paths.NOTE_DETAILS,
      page: () => const NoteDetailsView(),
      binding: NoteDetailsBinding(),
    ),
    GetPage(
      name: _Paths.FILES_LISTING,
      page: () => const FilesListingView(),
      binding: FilesListingBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_DETILS,
      page: () => const ProfileDetilsView(),
      binding: ProfileDetilsBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => const ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.DELETE_ACCOUNT,
      page: () => const DeleteAccountView(),
      binding: DeleteAccountBinding(),
    ),
    GetPage(
      name: _Paths.F_A_QS,
      page: () => const FAQsView(),
      binding: FAQsBinding(),
    ),
  ];
}
