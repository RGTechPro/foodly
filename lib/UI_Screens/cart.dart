import 'package:flutter/material.dart';
import 'package:schaffen_task/Components/button.dart';
import 'package:schaffen_task/Constants/size_config.dart';
import 'package:schaffen_task/UI_Screens/checkout.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: SizeConfig.screenWidth! * 0.6,
          child: DefaultButton(
            text: 'Checkout',
            press: () {
              Navigator.pushNamed(context, Checkout.routeName);
            },
          ),
        ),
      ),
    );
  }
}
