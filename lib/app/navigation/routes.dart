import 'package:get/get.dart';

// Pages
import 'package:ceiba/app/ui/home/home_page.dart';
import 'package:ceiba/app/ui/splash/splash_page.dart';


// Binding
import 'package:ceiba/app/ui/home/home_binding.dart';

class AsdPages {

  static const String splashPage = '/';
  static const String loginPage = '/login';
  static const String homePage = '/home';

}


List<GetPage> routes = [
  GetPage(
    name: AsdPages.splashPage,
    page: () => const SplashPage()
  ),
  GetPage(
    name: AsdPages.homePage,
    page: () => const HomePage(),
    binding: HomeBinding(),
  ),
];