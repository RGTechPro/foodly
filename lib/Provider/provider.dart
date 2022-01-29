import 'package:flutter/material.dart';

class CounterModel with ChangeNotifier {
  double totalSumm = 0;
  bool _isVeg = true;
  double get totalSum => totalSumm;
  bool get isVeg => _isVeg;
 
  void zero() {
    totalSumm = 0;
    notifyListeners();
  }

  void increment({double? price}) {
    totalSumm += price!;
    notifyListeners();
  }

  void decrement({double? price}) {
    totalSumm -= price!;
    notifyListeners();
  }

  void change() {
    _isVeg = !_isVeg;
    notifyListeners();
  }
}
