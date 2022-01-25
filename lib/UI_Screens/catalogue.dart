import 'package:flutter/material.dart';
import 'package:schaffen_task/Components/button.dart';
import 'package:schaffen_task/Constants/size_config.dart';
import 'package:schaffen_task/UI_Screens/cart.dart';

class Catalogue extends StatelessWidget {
  const Catalogue({Key? key}) : super(key: key);
  static String routeName = "/catalogue";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: SizeConfig.screenWidth! * 0.6,
          child: DefaultButton(
            text: 'Go To Cart',
            press: () {
              Navigator.pushNamed(context, Cart.routeName);
            },
          ),
        ),
      ),
    );
  }
}
