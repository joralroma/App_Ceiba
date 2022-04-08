import 'package:flutter/material.dart';

class TriiCircleAvatar extends StatelessWidget {

  const TriiCircleAvatar({
    Key? key,
    required this.url,
    this.radius = 10,
  }) : super(key: key);

  final double radius;
  final String url;

  @override
  Widget build(BuildContext context) {

    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.grey,
      child: Container(
        width: radius * 2,
        height: radius * 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Image.asset(
            'assets/Imgs/Profile.jpeg',
            fit: BoxFit.cover
          ),
        ),
      )
    );

  }

}