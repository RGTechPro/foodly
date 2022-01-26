import 'package:flutter/material.dart';
PreferredSizeWidget Appbar()
{
  return AppBar(
    backgroundColor: Colors.black,
    centerTitle: true,
    title: const Text(
      "Welcome to Restro",
      style: TextStyle(color: Colors.white,fontSize: 25),
    ),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25))),
  );
}