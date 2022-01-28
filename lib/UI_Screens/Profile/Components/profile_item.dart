
import 'package:flutter/material.dart';
class ProfileCard extends StatelessWidget {
  ProfileCard({Key? key,required this.namee,required this.icons,required this.route}) : super(key: key);
  String namee,route;
  IconData icons;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 500,
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black),
        child: Card(
          color: Colors.black,
          child: Center(
            child: Text(
              namee,
              style: const TextStyle(color: Colors.amber,fontSize: 20,fontWeight: FontWeight.bold),
            ),
          ),
        ))
    ;
  }
}