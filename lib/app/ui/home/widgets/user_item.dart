import 'package:get/get.dart';
import 'package:flutter/material.dart';

// Controller
import 'package:ceiba/app/ui/home/home_controller.dart';

// i18n
import 'package:ceiba/app/i18n/ceiba_localization.dart';

// Widgets
import 'list_publications.dart';
import 'package:ceiba/app/ui/widgets/text_item.dart';

// Models
import 'package:ceiba/app/models/user.dart';

// Utils
import 'package:ceiba/app/utils/modal.dart';

class UserItem extends GetWidget<HomeController> {

  const UserItem({
    Key? key,
    required this.user
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {

    final CeibaLocalization _ceibaLocalization = CeibaLocalization.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 1, right: 1, bottom: 20, left: 1),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            blurRadius: 1.0,
            spreadRadius: 0.0,
            offset: const Offset(0.0, 0.0),
            color: Colors.black.withOpacity(.5)
          )
        ]
      ),
      child: Column(
        children: [
          CeibaTextItem(
            isTitle: true,
            text: user.name
          ),
          CeibaTextItem(
            icon: Icons.phone,
            text: user.phone
          ),
          CeibaTextItem(
            icon: Icons.email,
            text: user.email
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () => _showPublications(context),
            child: CeibaTextItem(
              flexEnd: true,
              isTitle: true,
              text: _ceibaLocalization.translate('body.viewPublications')
            ),
          )
        ],
      ),
    );
  }

  void _showPublications(BuildContext context) {
    CeibaModal.showModalBottom(context, ListPublications(user: user));
  }

}