import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

// i18n
import 'package:ceiba/app/i18n/ceiba_localization.dart';

// Controller
import 'package:ceiba/app/ui/home/home_controller.dart';

// Widgets
import 'widgets/home_appbar.dart';
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

  late final CeibaLocalization _ceibaLocalization;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => _initState());
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent));    
  }

  void _initState() {
    _ceibaLocalization = CeibaLocalization.of(context);
    _getListUsers();
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const HomeAppBar(),        
        body: SafeArea(
          child: Column(
            children: [
              Obx(
                () => Expanded(
                  child: _homeController.loadingUsers ? const HomeLoader() : const ListUsers(),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }

  void _getListUsers() async {
    final CeibaError? error = await _homeController.getListUsers();
    if(error != null) {
      CeibaModal.showSnackbar(context, '¡Error!', _ceibaLocalization.translate(error.message));
    }
  }

}