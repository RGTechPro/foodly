import 'package:flutter/material.dart';



class CounterModel with ChangeNotifier {
  double _totalSum = 0;
 bool _isVeg=true;
  double get totalSum => _totalSum;
  bool get isVeg=>_isVeg;

  void zero()
  {
    _totalSum=0;
    notifyListeners();
  }
  void increment({double?price}) {
    _totalSum+=price!;
    notifyListeners();
  }
  void decrement({double?price}) {
    _totalSum-=price!;
    notifyListeners();
  }
  void change()
  {
    _isVeg=!_isVeg;
    notifyListeners();
  }
}



