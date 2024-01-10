import 'package:flutter_application_1/app/bindings/comparison.binding.dart';
import 'package:flutter_application_1/app/bindings/home.binding.dart';
import 'package:flutter_application_1/app/bindings/login.binding.dart';
import 'package:flutter_application_1/app/bindings/navigation.binding.dart';
import 'package:flutter_application_1/app/bindings/reviews.binding.dart';
import 'package:flutter_application_1/app/bindings/tickets.binding.dart';
import 'package:flutter_application_1/app/ui/pages/comparison/comparison.page.dart';
import 'package:flutter_application_1/app/ui/pages/navigation/navigation.layout.dart';
import 'package:flutter_application_1/app/ui/pages/home/home.page.dart';
import 'package:flutter_application_1/app/ui/pages/login/login.page.dart';
import 'package:flutter_application_1/app/ui/pages/reviews/reviews.page.dart';
import 'package:flutter_application_1/app/ui/pages/splash.page.dart';
import 'package:flutter_application_1/app/ui/pages/tickets/tickets.page.dart';
import 'package:get/get.dart';
part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.NAVIGATION,
      page: () => const NavigationLayout(),
      binding: NavigationLayoutBinding(),
    ),
    GetPage(
      name: Routes.REVIEWS,
      page: () => const ReviewsPage(),
      binding: ReviewsBinding(),
    ),
    GetPage(
      name: Routes.TICKETS,
      page: () => const TicketsPage(),
      binding: TicketsBinding(),
    ),
    GetPage(
      name: Routes.COMPARISON,
      page: () => const ComparisonPage(),
      binding: ComparisonBinding(),
    )
  ];
}
