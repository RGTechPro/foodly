import 'package:flutter/material.dart';
import 'package:schaffen_task/Components/custom_text.dart';
import 'package:schaffen_task/Constants/constants.dart';
import 'package:schaffen_task/Constants/size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.text,
    this.press,
  }) : super(key: key);
  final String? text;
  final dynamic press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
          backgroundColor: MaterialStateProperty.all(kPrimaryColor),
        ),
        onPressed: press,
        child: CustomText(
          text: text!,
          fontSize: getProportionateScreenWidth(18),
          color: kTextColor,
        ),
      ),
    );
  }
}
