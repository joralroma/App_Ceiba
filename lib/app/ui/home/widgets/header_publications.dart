import 'package:flutter/material.dart';

// Widgets
import 'package:ceiba/app/ui/widgets/text_item.dart';

// Models
import 'package:ceiba/app/models/user.dart';

class HeaderPublications extends StatelessWidget {

  const HeaderPublications({
    Key? key,
    required this.user
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          CeibaTextItem(
            isTitle: true,
            text: user.name
          ),
          CeibaTextItem(
            icon: Icons.person,
            text: user.username
          ),
          CeibaTextItem(
            icon: Icons.phone,
            text: user.phone
          ),
          CeibaTextItem(
            icon: Icons.email,
            text: user.email
          ),          
        ],
      ),
    );
  }
}