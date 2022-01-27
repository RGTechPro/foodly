import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schaffen_task/Components/button.dart';
import 'package:schaffen_task/Constants/size_config.dart';
import 'package:schaffen_task/UI_Screens/Catalogue-Screen/catalogue.dart';

import 'p_item_w.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);
  static String routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage(
                        'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg')),
              ),
              Text(
                "Praveen",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "abcd@gmail.com",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "+91 8282828282",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment,
              children: <Widget>[
                p_card_w(namee: "My Order",icons: Icons.add_shopping_cart,route: "/my_order"),
                SizedBox(height: 15,),
                p_card_w(namee: "My Addesses",icons: Icons.add_shopping_cart,route: "test"),
                SizedBox(height: 15,),
                p_card_w(namee: "Help",icons: Icons.add_shopping_cart,route: "test"),
                SizedBox(height: 15,),
                p_card_w(namee: "Logout",icons: Icons.add_shopping_cart,route: "test"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
