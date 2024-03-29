import 'package:daaem_reports/Core/Routes/routes_name.dart';
import 'package:daaem_reports/Feature/Competitors%20Screen/Promotion%20Screen%20in%20Competitors/promo_screen.dart';
import 'package:daaem_reports/Feature/Scanner%20Screen/scanner_screen.dart';
import 'package:daaem_reports/Feature/Sign%20In/sign_in.dart';
import 'package:get/get.dart';

import '../../Feature/Category Screen.dart/category_screen.dart';
import '../../Feature/Competitors Screen/competitors_screen.dart';
import '../../Feature/Competitors Screen/materialSales.dart/materialsales.dart';
import '../../Feature/Home Screen.dart/home_screen.dart';
import '../../Feature/Promotion Screen/promotion_screen.dart';
import '../../Feature/Promotion Screen/Secondary place/secondary _place_screen.dart';
import '../../Feature/Splash Screen/spash_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RoutesName.SplashScreen,
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: RoutesName.SignIn,
          page: () => SignIn(),
        ),
        GetPage(
          name: RoutesName.homeScreen,
          page: () => const HomeScreen(),
        ),
        GetPage(
          name: RoutesName.planogramScreen,
          page: () => PromotionScreen(),
        ),
        GetPage(
          name: RoutesName.competitorsScreen,
          page: () => CompetitorsScreen(),
        ),
        GetPage(
          name: RoutesName.categoryScreen,
          page: () => const CategoryScreen(),
        ),
        GetPage(
          name: RoutesName.scannerScreen,
          page: () => const ScannerScreen(),
        ),
        GetPage(
          name: RoutesName.secondaryplace,
          page: () => const Secondaryplace(),
        ),
        GetPage(
          name: RoutesName.materialSales,
          page: () => MaterialSalesScreen(),
        ),
        GetPage(
          name: RoutesName.promoScreen,
          page: () => const PromoScreen(),
        ),
      ];
}
