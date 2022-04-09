import 'package:get/get.dart';
import 'package:flutter/material.dart';

// Controller
import 'package:ceiba/app/ui/home/home_controller.dart';

// i18n
import 'package:ceiba/app/i18n/ceiba_localization.dart';

// Widgets
import 'user_item.dart';
import 'package:ceiba/app/ui/widgets/input.dart';

// Utils
import 'package:ceiba/app/utils/theme.dart';
import 'package:ceiba/app/utils/responsive.dart';

class ListUsers extends GetView<HomeController> {

  const ListUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final CeibaLocalization _ceibaLocalization = CeibaLocalization.of(context);

    final Responsive _responsive = Responsive(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: InputCeiba(
              placeholder: _ceibaLocalization.translate('body.search'),
              model: controller.search,
              colorText: CeibaTheme.colorText,
            ),
          ),           
          Expanded(
            child: Obx(
              () => controller.users.isEmpty ? Center(
                child: Text(
                  _ceibaLocalization.translate('body.listEmpty'),
                  style: CeibaTheme.styleTitle.copyWith(
                    fontSize: _responsive.ip(2.2),
                    color: CeibaTheme.primaryColor
                  ),
                )
              ) : ListView.builder(
                itemCount: controller.users.length,
                itemBuilder: (BuildContext _, int index) => UserItem(user: controller.users[index])
              ),
            ),
          ),
        ],
      ),
    );
  }
}