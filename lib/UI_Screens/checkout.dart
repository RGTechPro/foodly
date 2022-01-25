import 'package:flutter/material.dart';
import 'package:schaffen_task/Components/button.dart';
import 'package:schaffen_task/Constants/size_config.dart';
import 'package:schaffen_task/UI_Screens/order_track.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);
  static String routeName = "/checkout";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: SizeConfig.screenWidth! * 0.6,
          child: DefaultButton(
            text: 'Order Tracker',
            press: () {
              Navigator.pushNamed(context, OrderTracker.routeName);
            },
          ),
        ),
      ),
    );
  }
}
