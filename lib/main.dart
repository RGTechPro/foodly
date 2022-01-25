import 'package:flutter/material.dart';
import 'package:schaffen_task/Routes/routes.dart';
import 'package:schaffen_task/Themes/themes.dart';

import 'UI_Screens/log_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Schaffen',
      theme: theme(),
      initialRoute: LogIn.routeName,
      routes: routes,
    );
  }
}
