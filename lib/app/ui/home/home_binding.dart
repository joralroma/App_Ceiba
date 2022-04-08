import 'package:get/get.dart';

// Providers
import 'package:ceiba/app/providers/home_provider.dart';
import 'package:ceiba/app/providers/http_provider.dart';

// Controller
import 'package:ceiba/app/ui/home/home_controller.dart';

class HomeBinding implements Bindings{

  @override
  void dependencies() {
    final HttpProvider _httpProvider = HttpProvider();
    final HomeProvider _homeProvider = HomeProvider(_httpProvider);
    Get.put<HomeController>(HomeController(_homeProvider));
  }

}