// @dart=2.8
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:schaffen_task/cart.dart';
import 'package:schaffen_task/search.dart';

import 'account.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

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
  const home_page({Key key}) : super(key: key);

  @override
  _home_pageState createState() => _home_pageState();
}

List<String> images = [
  "https://i.pinimg.com/564x/98/10/68/981068fd1f0e3e4abe295f528a85afc7.jpg",
  "https://i.pinimg.com/564x/30/e9/0e/30e90e6a2ab19808fea52928cc3c49ae.jpg",
  "https://i.pinimg.com/564x/e9/6d/c6/e96dc6df6644363e95a2ef47f5ab20d0.jpg",
  "https://myfoodstory.com/wp-content/uploads/2021/06/Chilli-Paneer-1.jpg",
  "https://i.pinimg.com/564x/19/4d/dd/194ddd7e423e7cfd2fd81e0362660c51.jpg",
  "https://i.pinimg.com/564x/2f/b4/5e/2fb45e95dbc699d79d36b37e53fa21e2.jpg",
  "https://i.pinimg.com/564x/41/c7/bf/41c7bf3422cff4a9ac1fb49f4d545513.jpg",
  "https://i.pinimg.com/236x/52/1a/01/521a01d28f8bc09a8042ee20a0f6451c.jpg",
  "https://i.pinimg.com/564x/e8/df/d1/e8dfd1f933d13310ab29c5d50150ee1d.jpg",
  "https://i.pinimg.com/564x/e0/0e/70/e00e70a5fd2add0f9a2a6b9bd73729d9.jpg",
]; //List of Cards with color and icon
List<String> food_name = [
  "first_wala",
  "second_wala",
  "third_wala",
  "fourth wala",
  "fifth_wala",
  "sixth_wala",
  "seventh_wala",
  "eight_wala",
  "nineth_wala",
  "tenth_wala"
];

List<String> prices=[
  "₹910.99","₹1020.10","₹400.22","₹233.90","₹1221.9","₹783.78","₹898.92","₹550.11","₹220.00","₹330.55"
];

class _home_pageState extends State<home_page> {
  int _current_index = 0;
  int selected_item_index;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Color.fromRGBO(70, 70, 70, 50) ,
        extendBody: true,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black,
            ),
            child: BottomNavigationBar(
              selectedItemColor: Colors.amberAccent,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.black,
              unselectedItemColor: Colors.white,
              selectedFontSize: 10,
              showUnselectedLabels: false,

              // selectedIconTheme: const IconThemeData(opacity: 100),
              // unselectedIconTheme:const IconThemeData(opacity: 90) ,
              // selectedLabelStyle: TextStyle( ),
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
        body: StaggeredGridView.countBuilder(
          padding: EdgeInsets.all(5),
          crossAxisCount: 4,
          itemCount: images.length,
          itemBuilder: (BuildContext context, int index) => Container(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.black,
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){print("pressed : "+index.toString());},
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(images[index])),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Text(
                          food_name[index],
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.amberAccent,fontSize: 15),
                        ),Text(
                          prices[index],
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.amberAccent,fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              elevation: 20,
            ),
          ),
          staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ),
      ),
    );
  }

  void tapped(int index) {
    switch (index) {
      case 0:
        print("in home");
        Navigator.pushNamed(context, '/');
        break;

      case 1:
        print("in search");
        // Navigator.pushNamed(context, '/search');
        break;

      case 2:
        print("in cart");
        // Navigator.pushNamed(context, '/cart');
        break;

      case 3:
        print("in account");
        // Navigator.pushNamed(context, '/account');
        break;

      default:
        break;
    }
    setState(() {
      _current_index = index;
    });
  }
}
