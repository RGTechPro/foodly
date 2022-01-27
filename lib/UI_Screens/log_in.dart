import 'package:flutter/material.dart';
import 'package:schaffen_task/Components/button.dart';
import 'package:schaffen_task/Constants/size_config.dart';
import 'package:schaffen_task/UI_Screens/Catalogue-Screen/catalogue.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);
  static String routeName = "/log_in";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: SizeConfig.screenWidth! * 0.6,
          child: DefaultButton(
            text: 'LogIn',
            press: () {
              Navigator.pushNamed(context, CatalogueScreen.routeName);
            },
          ),
        ),
      ),
    );
  }
}
