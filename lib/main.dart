import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Providers
import 'package:ceiba/app/providers/database_provider.dart';

// Widgets
import 'app/app_widget.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  DatabaseProvider.instance.initDatabase(); 
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]).then((value) => runApp(const MyApp() ));

}