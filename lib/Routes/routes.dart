import 'package:flutter/material.dart';
import 'package:schaffen_task/UI_Screens/Cart/cart.dart';
import 'package:schaffen_task/UI_Screens/Catalogue-Screen/catalogue.dart';
import 'package:schaffen_task/UI_Screens/checkout.dart';
import 'package:schaffen_task/UI_Screens/log_in.dart';
import 'package:schaffen_task/UI_Screens/order_track.dart';
import 'package:schaffen_task/UI_Screens/profile.dart';
import 'package:schaffen_task/UI_Screens/search.dart';

final Map<String, WidgetBuilder> routes = {
  LogIn.routeName: (context) => const LogIn(),
  CartScreen.routeName: (context) => const CartScreen(),
  Checkout.routeName: (context) => const Checkout(),
  OrderTracker.routeName: (context) => const OrderTracker(),
  CatalogueScreen.routeName: (context) => const CatalogueScreen(),
  Profile.routeName:(context)=>const Profile(),
  Search.routeName:(context)=>const Search(),
};
