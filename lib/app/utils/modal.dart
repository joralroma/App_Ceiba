import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

// Utils
import 'package:ceiba/app/utils/theme.dart';
import 'package:ceiba/app/utils/responsive.dart';


class CeibaModal {

  static void showSnackbar(BuildContext context, String title, String msm, {Color bg = Colors.red}) {
    
    final Responsive _responsive = Responsive(context);

    Get.snackbar(
      title,
      msm,
      backgroundColor: bg,
      messageText: Text(
        msm,
        style: CeibaTheme.styleTitle.copyWith(
          color: Colors.white,
          fontSize: _responsive.ip(1.6)
        ),
      ),
      titleText: Text(
        title,
        style: CeibaTheme.styleTitle.copyWith(
          color: Colors.white,
          fontSize: _responsive.ip(2.0)
        ),
      )
    );
  }

  static void showModalBottom(BuildContext context, Widget widget) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      isDismissible: true,
      builder: (_) => widget
    );
  }

}