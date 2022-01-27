import 'package:flutter/material.dart';
import 'package:schaffen_task/Components/custom_text.dart';
import 'package:schaffen_task/Constants/constants.dart';
import 'package:schaffen_task/Constants/size_config.dart';
import 'package:schaffen_task/UI_Screens/Checkout/Components/body.dart';
import 'package:schaffen_task/UI_Screens/Order_Tracker/order_track.dart';
class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);
  static String routeName = "/checkout";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: InkWell(
            onTap: ()
            {
              Navigator.pushNamed(context, OrderTracker.routeName);
            },
            child: Container(
              height: getProportionateScreenHeight(50),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: kPrimaryColor,
              ),
              child: Center(
                child: CustomText(
                  text: 'Place Order',
                  fontSize: 24,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Checkout',
            style: TextStyle(
              color: Colors.black,
              fontSize: getProportionateScreenWidth(20),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: const Body());
  }
}
