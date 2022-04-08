import 'package:get/get.dart';

// Store
import 'package:ceiba/app/providers/database_provider.dart';
import 'package:ceiba/app/resources/database_resource.dart';


class AppBinding implements Bindings{

  @override
  void dependencies() {
    Get.put<DatabaseResource>(DatabaseProvider());
  }

}