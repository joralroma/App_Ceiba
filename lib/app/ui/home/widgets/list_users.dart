import 'package:flutter/material.dart';

// Widgets
import 'user_item.dart';

// Models
import 'package:ceiba/app/models/user.dart';

class ListUsers extends StatelessWidget {

  const ListUsers({
    Key? key,
    required this.users
  }) : super(key: key);

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (BuildContext _, int index) => UserItem(user: users[index])
            ),
          ),
        ],
      ),
    );
  }
}