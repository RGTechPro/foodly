import 'package:flutter/material.dart';



class CounterModel with ChangeNotifier {
  int _totalSum = 0;

  int get totalSum => _totalSum;

  void zero()
  {
    _totalSum=0;
    notifyListeners();
  }
  void increment({int?price}) {
    _totalSum+=price!;
    notifyListeners();
  }
  void decrement({int?price}) {
    _totalSum-=price!;
    notifyListeners();
  }
}



