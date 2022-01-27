import 'package:flutter/material.dart';
import 'package:schaffen_task/Components/custom_text.dart';

class OrderTracker extends StatelessWidget {
  const OrderTracker({Key? key}) : super(key: key);
  static String routeName = "/order_tracker";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomText(
          text: 'ThankYou',
        ),
      ),
    );
  }
}
