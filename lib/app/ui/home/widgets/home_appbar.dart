import 'package:flutter/material.dart';

// i18n
import 'package:ceiba/app/i18n/ceiba_localization.dart';

// Utils
import 'package:ceiba/app/utils/theme.dart';
import 'package:ceiba/app/utils/responsive.dart';

class HomeAppBar extends StatelessWidget  implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final CeibaLocalization _ceibaLocalization = CeibaLocalization.of(context);

    final Responsive _responsive = Responsive(context);
    
    return Container(
      height: 100,
      padding: const EdgeInsets.only(top: 0, right: 0, bottom: 20, left: 20),
      alignment: Alignment.bottomLeft,
      decoration: const BoxDecoration(
        color: CeibaTheme.primaryColor,
      ),
      child: Text(
        _ceibaLocalization.translate('body.title'),
        style: CeibaTheme.styleTitle.copyWith(
          color: Colors.white,
          fontSize: _responsive.ip(2.2)
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);

}