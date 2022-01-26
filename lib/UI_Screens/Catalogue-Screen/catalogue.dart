import 'package:flutter/material.dart';
import 'package:schaffen_task/Components/appbar.dart';
import 'package:schaffen_task/Components/bottom_navigation.dart';
import 'package:schaffen_task/UI_Screens/Catalogue-Screen/Component/restaurant_grid.dart';
class CatalogueScreen extends StatefulWidget {
  const CatalogueScreen({Key? key}) : super(key: key);
  static String routeName = "/homepage";
  @override
  _CatalogueScreenState createState() => _CatalogueScreenState();
}
class _CatalogueScreenState extends State<CatalogueScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Color.fromRGBO(70, 70, 70, 50) ,
          extendBody: true,
          bottomNavigationBar: const Padding(
            padding: EdgeInsets.all(10.0),
            child: BottomNavigation()
          ),
          body: Scaffold(
            appBar: Appbar(),
            body: const RestaurantGrid(),
          ),
      ),
    );
  }


}
