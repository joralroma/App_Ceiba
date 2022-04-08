import 'package:flutter/material.dart';

class TriiImg extends StatelessWidget {
  const TriiImg({Key? key, required this.url, this.radius = 5.0}) : super(key: key);

  final String url;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.network(
        url,
        fit: BoxFit.cover,
      ),
    );
  }
}
