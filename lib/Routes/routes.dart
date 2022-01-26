import 'package:flutter/material.dart';
import 'package:schaffen_task/UI_Screens/cart.dart';
import 'package:schaffen_task/UI_Screens/catalogue.dart';
import 'package:schaffen_task/UI_Screens/checkout.dart';
import 'package:schaffen_task/UI_Screens/log_in.dart';
import 'package:schaffen_task/UI_Screens/order_track.dart';

final Map<String, WidgetBuilder> routes = {
  LogIn.routeName: (context) => const LogIn(),
  Cart.routeName: (context) => const Cart(),
  Checkout.routeName: (context) => const Checkout(),
  OrderTracker.routeName: (context) => const OrderTracker(),
  home_page.routeName: (context) => const home_page(),
};
