import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

// Controller
import 'package:ceiba/app/ui/home/home_controller.dart';

// Widgets
import 'widgets/list_users.dart';
import 'widgets/home_loader.dart';

// Models
import 'package:ceiba/app/models/error.dart';

// Utils
import 'package:ceiba/app/utils/modal.dart';



class HomePage extends StatefulWidget {

  const HomePage({
    Key? key
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final HomeController _homeController = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _getListUsers(context);
    });
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent
    ));    
  }

  @override
  Widget build(BuildContext context) {

    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              children: [
                Expanded(
                  child: _homeController.loadingUsers ? const HomeLoader() : ListUsers(users: _homeController.users),
                ),
              ],
            ),
          )
        ),
      ),
    );

  }

  void _getListUsers(BuildContext context) async {
    final CeibaError? error = await _homeController.getListUsers();
    if(error != null) {
      CeibaModal.showSnackbar(context, '¡Error!', error.message);
    }
  }

}