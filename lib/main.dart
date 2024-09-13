
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wandabook/app/ui/utils/app_constants.dart';
import 'package:wandabook/global.dart';
import 'app/data/services/dependency_injection.dart';
import 'app/data/services/theme_service.dart';
import 'app/data/services/translations_service.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';
import 'app/ui/layouts/main/main_layout.dart';
import 'app/ui/theme/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await DependecyInjection.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
    bool isLoggedIn = Global.storageService.getIsLoggedIn();

    String getInitialRoute() {
      if (!deviceFirstOpen) {
        Global.storageService.setBool(AppConstant.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
        return AppRoutes.ONBOARDING;
      } else if (isLoggedIn) {
        return AppRoutes.HOME;
      } else {
        return AppRoutes.HOME;
      }
    }
   return ScreenUtilInit(
      builder: (_,__) {
        return GetMaterialApp(
          title: 'Wandabook',
          debugShowCheckedModeBanner: false,
          theme: Themes().lightTheme,
          darkTheme: Themes().darkTheme,
          themeMode: ThemeService.instance.themeMode,
          translations: Translation(),
          locale: const Locale('en'),
          fallbackLocale: const Locale('en'),
          initialRoute: getInitialRoute(),
          unknownRoute: AppPages.unknownRoutePage,
          getPages: AppPages.pages,
          builder: (_, child) {
            return MainLayout(child: child!);
          },
        );
      },
     //! Must change it to true if you want to use the ScreenUtil
      designSize: const Size(411, 823),
    );
  }
}
