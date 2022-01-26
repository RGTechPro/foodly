import 'package:flutter/material.dart';
import 'package:schaffen_task/Components/button.dart';
import 'package:schaffen_task/Constants/size_config.dart';
import 'package:schaffen_task/UI_Screens/Catalogue-Screen/catalogue.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);
  static String routeName = "/search";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: SizeConfig.screenWidth! * 0.6,
          child: DefaultButton(
            text: 'Search',
            press: () {
              // Navigator.pushNamed(context, CatalogueScreen.routeName);
            },
          ),
        ),
      ),
    );
  }
}
