import 'package:flutter/material.dart';

// Widgets
import 'package:ceiba/app/ui/widgets/text_item.dart';

// Models
import 'package:ceiba/app/models/publication.dart';

// Utils
import 'package:ceiba/app/utils/extencions.dart';

class PublicationItem extends StatelessWidget {

  const PublicationItem({
    Key? key,
    required this.publication
  }) : super(key: key);

  final Publication publication;

  @override
  Widget build(BuildContext context) {
  
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
            maxLines: 2,
            text: publication.title.capitalize
          ),
          const SizedBox(height: 10),
          CeibaTextItem(
            maxLines: 5,
            text: publication.body.capitalize
          ),
        ],
      ),
    );

  }
}