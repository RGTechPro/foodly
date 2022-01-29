import 'package:flutter/cupertino.dart';
import 'package:schaffen_task/Models/product_data.dart';
import 'package:schaffen_task/Models/restro_data.dart';

class Cart extends ChangeNotifier {
  List<ProductData> cartList = [];
  RestroData ?restroData;
  double totalAmount = 0;
  int discount = 0;
  double amountToBePaid = 0;
}
