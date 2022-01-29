import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schaffen_task/Models/cart_models.dart';
import 'package:schaffen_task/Provider/cart.dart';
import 'package:schaffen_task/UI_Screens/Cart/Components/body.dart';

import 'Components/checkout_card.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";

  const CartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const Body(),
      bottomNavigationBar: const CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    var provider = Provider.of<Cart>(context);
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Column(
        children: [
           Text(
            provider.restroData!.r_name,
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${provider.cartList.length} items",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
