import 'package:flutter/material.dart';
import 'package:schaffen_task/Constants/size_config.dart';
import 'package:schaffen_task/UI_Screens/Checkout/Components/delivery_address.dart';
import 'package:schaffen_task/UI_Screens/Checkout/Components/order_summary.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        DeliveryAddress(
          name: 'Sanskar Modi',
          address: 'Vikas Nagar, Lucknow',
          phoneNo: '7905709124',
        ),
        SizedBox(
          height: getProportionateScreenHeight(5),
        ),
        OrderSummary(),
      ],
    ));
  }
}
