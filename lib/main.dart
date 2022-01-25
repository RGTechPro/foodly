import 'package:flutter/material.dart';
import 'package:schaffen_task/cart.dart';
import 'package:schaffen_task/search.dart';

import 'account.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/search': (context) => search(),
        '/cart': (context) => cart(),
        '/account': (context) => account(),
      },
      title: 'Schaffen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: home_page(),
    );
  }
}
class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {

  int _current_index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          padding: EdgeInsets.all(7),
decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.black,),
          child: BottomNavigationBar(

            selectedItemColor: Colors.amberAccent,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            unselectedItemColor: Colors.white,
            selectedFontSize: 10,
            showUnselectedLabels: false,
            // selectedLabelStyle: ,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "Search",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                label: "Account",
              ),
            ],
            currentIndex: _current_index,
            onTap: tapped,
          ),
        ),
      ),
      );

  }
  void tapped(int index) {
    switch (index) {
      case 0:print("in home");
      Navigator.pushNamed(context, '/');
      break;

      case 1:print("in search");
      Navigator.pushNamed(context, '/search');
      break;

      case 2:print("in cart");
      Navigator.pushNamed(context, '/cart');
      break;

      case 3:print("in account");
      Navigator.pushNamed(context, '/account');
      break;

      default:
        break;
    }
    setState(() {
      _current_index = index;
    });
  }
}

