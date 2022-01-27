import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schaffen_task/Components/button.dart';
class my_order extends StatelessWidget {
  const my_order({Key? key}) : super(key: key);
static String routeName="/my_orders";
  @override
  Widget build(BuildContext context) {
    return DefaultButton(text:"my orders");
  }
}
