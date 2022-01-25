import 'package:flutter/material.dart';
import 'package:schaffen_task/Constants/constants.dart';

Widget CustomText({
  String? text,
  double? fontSize,
  FontWeight? fontWeight,
  Color? color = kTextColor,
  TextAlign? position,
}) {
  return Text(
    '$text',
    style: TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
    textAlign: position,
  );
}
