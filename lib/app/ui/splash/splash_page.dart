import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

// Navigation
import 'package:ceiba/app/navigation/routes.dart';

// Utils
import 'package:ceiba/app/utils/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _initState();
    });
  }

  void _initState() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAllNamed(AsdPages.homePage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CeibaTheme.primaryColor,
      body: SafeArea(
          child: SvgPicture.asset(
          'assets/Imgs/splash.svg',
          fit: BoxFit.cover,
        )
      ),
    );
  }
}
