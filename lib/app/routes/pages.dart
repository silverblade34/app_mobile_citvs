import 'package:citvs/app/bindings/comparison_binding.dart';
import 'package:citvs/app/bindings/login_binding.dart';
import 'package:citvs/app/bindings/reviews_binding.dart';
import 'package:citvs/app/bindings/tickets_binding.dart';
import 'package:citvs/app/bindings/vehicles_binding.dart';
import 'package:citvs/app/ui/pages/comparison/comparison_page.dart';
import 'package:citvs/app/ui/pages/login/login_page.dart';
import 'package:citvs/app/ui/pages/reviews/reviews_page.dart';
import 'package:citvs/app/ui/pages/splash_page.dart';
import 'package:citvs/app/ui/pages/tickets/tickets_page.dart';
import 'package:citvs/app/ui/pages/vehicles/vehicles_page.dart';
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
    ),
    GetPage(
      name: Routes.VEHICLES,
      page: () => const VehiclesPage(),
      binding: VehiclesBinding(),
    )
  ];
}
