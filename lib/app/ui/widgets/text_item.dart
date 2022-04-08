import 'package:flutter/material.dart';

// Utils
import 'package:ceiba/app/utils/theme.dart';
import 'package:ceiba/app/utils/responsive.dart';

class CeibaTextItem extends StatelessWidget {

  const CeibaTextItem({
    Key? key,
    this.icon,
    this.maxLines = 1,
    required this.text,
    this.flexEnd = false,
    this.isTitle = false
  }) : super(key: key);

  final String text;
  final bool isTitle;
  final int maxLines;
  final bool flexEnd;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {

    final Responsive _responsive = Responsive(context);

    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          (icon != null) ? Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              icon,
              color: CeibaTheme.primaryColor,
              size: 18,
            ),
          ) : const SizedBox.shrink(),
          Expanded(
            child: Text(
              text,
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
              textAlign: flexEnd ? TextAlign.end : TextAlign.start,
              style: CeibaTheme.styleText.copyWith(
                color: isTitle ? CeibaTheme.primaryColor : CeibaTheme.colorText,
                fontSize: (isTitle && !flexEnd) ? _responsive.ip(2.0) : _responsive.ip(1.6),
                fontFamily: isTitle ? 'NunitoBold' : 'OpenSasSemiBold'
              ),            
            ),
          ),
        ],
      ),
    );

  }

}