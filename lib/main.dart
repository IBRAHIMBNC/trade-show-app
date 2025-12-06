import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/generated/locales.g.dart';
import 'package:supplier_snap/init_services.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: dotenv.env['projectURL']!,
    anonKey: dotenv.env['anonKey']!,
  );
  await InitServices.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const double designWidth = 375;
  static const double designHeight = 812;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      child: ScreenUtilInit(
        designSize: Size(designWidth, designHeight),
        minTextAdapt: true,
        enableScaleText: () => false,
        splitScreenMode: true,
        builder: (context, child) {
          return child!;
        },
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          },
          child: GetMaterialApp(
            title: "Supplier Snap",
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            theme: ThemeData(
              useMaterial3: true,
              scaffoldBackgroundColor: KColors.white,
              colorScheme: ColorScheme.fromSwatch().copyWith(
                surfaceTint: Colors.transparent,
              ),
            ),
            translationsKeys: AppTranslation.translations,
          ),
        ),
      ),
    );
  }
}
