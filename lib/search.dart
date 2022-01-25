import 'package:flutter/material.dart';

void main() {
  runApp(const search());
}

class search extends StatelessWidget {
  const search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Text("search"),
      ),
    );
  }
}
