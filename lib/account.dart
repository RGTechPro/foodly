import 'package:flutter/material.dart';

void main() {
  runApp(const account());
}

class account extends StatelessWidget {
  const account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Text("account"),
      ),
    );
  }
}
