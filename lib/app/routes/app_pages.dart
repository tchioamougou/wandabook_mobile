import '../bindings/onboarding_binding.dart';
import '../ui/pages/onboarding_page/onboarding_page.dart';
      import '../bindings/sigin_binding.dart';
import '../ui/pages/sigin_page/sigin_page.dart';
      import '../bindings/login_binding.dart';
import '../ui/pages/login_page/login_page.dart';
      import '../bindings/theme_binding.dart';
import '../ui/pages/theme_page/theme_page.dart';
      import '../bindings/checkout_binding.dart';
import '../ui/pages/checkout_page/checkout_page.dart';
      import '../bindings/subscription_binding.dart';
import '../ui/pages/subscription_page/subscription_page.dart';
      import '../bindings/book_detail_binding.dart';
import '../ui/pages/book_detail_page/book_detail_page.dart';
      import '../bindings/bucket_binding.dart';
import '../ui/pages/bucket_page/bucket_page.dart';
      import '../bindings/profile_binding.dart';
import '../ui/pages/profile_page/profile_page.dart';
      import '../bindings/search_binding.dart';
import '../ui/pages/search_page/search_page.dart';
      import '../bindings/init_binding.dart';
import '../ui/pages/init_page/init_page.dart';
      import '../bindings/home_binding.dart';
import '../ui/pages/home_page/home_page.dart';
      import 'package:get/get.dart';


import '../bindings/home_binding.dart';
import '../ui/pages/home_page/home_page.dart';
import '../ui/pages/unknown_route_page/unknown_route_page.dart';
import 'app_routes.dart';

const _defaultTransition = Transition.native;

class AppPages {
  static final unknownRoutePage = GetPage(
    name: AppRoutes.UNKNOWN,
    page: () => const UnknownRoutePage(),
    transition: _defaultTransition,
  );

  static final List<GetPage> pages = [
    unknownRoutePage,
    GetPage(
      name: AppRoutes.HOME,
      page: () =>  HomePage(),
      binding: HomeBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () =>  HomePage(),
      binding: HomeBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.INIT,
      page: () => const InitPage(),
      binding: InitBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.SEARCH,
      page: () => const SearchPage(),
      binding: SearchBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.PROFILE,
      page: () => const ProfilePage(),
      binding: ProfileBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.BUCKET,
      page: () => const BucketPage(),
      binding: BucketBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.BOOK_DETAIL,
      page: () => const BookDetailPage(),
      binding: BookDetailBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.SUBSCRIPTION,
      page: () => const SubscriptionPage(),
      binding: SubscriptionBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.CHECKOUT,
      page: () => const CheckoutPage(),
      binding: CheckoutBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.THEME,
      page: () => const ThemePage(),
      binding: ThemeBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.SIGIN,
      page: () => const SiginPage(),
      binding: SiginBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.ONBOARDING,
      page: () => const OnboardingPage(),
      binding: OnboardingBinding(),
      transition: _defaultTransition,
    ), 
];
}