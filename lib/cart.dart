import 'package:flutter/material.dart';

void main() {
  runApp(const cart());
}

class cart extends StatelessWidget {
  const cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Text("cart"),
      ),
    );
  }
}
