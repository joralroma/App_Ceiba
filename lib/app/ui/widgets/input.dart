import 'package:flutter/material.dart';

// Models
import 'package:ceiba/app/models/input.dart';

// Utils
import 'package:ceiba/app/utils/theme.dart';
import 'package:ceiba/app/utils/responsive.dart';

class InputCeiba extends StatelessWidget {

  const InputCeiba({
    Key? key,
    required this.model,
    this.placeholder = '',
    this.maxLines = 1,
    this.colorText = Colors.white,
    this.textInputAction = TextInputAction.done,
    this.textInputType = TextInputType.text
  }) : super(key: key);

  final InputModel model;
  final int maxLines;
  final String placeholder;
  final Color colorText;
  final TextInputAction textInputAction;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {

    final Responsive _responsive = Responsive(context);

    return TextFormField(
      maxLines: maxLines,
      textAlignVertical: (maxLines == 1) ? TextAlignVertical.center : TextAlignVertical.top,
      controller: model.controller,
      obscureText: model.isSecure,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      style: CeibaTheme.styleText.copyWith(
        fontSize: _responsive.ip(1.8),
        color: colorText
      ),
      decoration: InputDecoration(
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: const EdgeInsets.only(top: 17, right: 20, bottom: 17, left: 20),
        errorStyle: const TextStyle(fontSize: 0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: CeibaTheme.border,
            width: 1.5
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: CeibaTheme.border,
            width: 1.5
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.5
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.5
          ),
        ),
        prefixStyle: const TextStyle(
          color: CeibaTheme.border
        ),
        labelText: placeholder,
        labelStyle: CeibaTheme.styleText.copyWith(
          color: CeibaTheme.placeholder,
          fontSize: _responsive.ip(1.8)
        )         
      ),
    );

  }

}