import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schaffen_task/Models/address.dart';


class AddressData extends ChangeNotifier {
  int selectedIndex = 0;
  bool isAddress = true;
  List<Address> addressList = [];
  // Address edit = Address(name: '', address: '', mobileNumber: '', city: '');
  // void changeColor(int index) {
  //   int i;
  //   if (addressList[index].a == Colors.white) {
  //     addressList[index].a = Colors.lightGreen.shade100;
  //   } else {
  //     addressList[index].a = Colors.white;
  //   }
  //   for (i = 0; i < addressList.length; i++) {
  //     if (i != index) addressList[i].a = Colors.white;
  //   }
  //   notifyListeners();
  // }

  // int checkSelected() {
  //   for (int i = 0; i < addressList.length; i++) {
  //     if (addressList[i].a == Colors.lightGreen.shade100) {
  //       return 1;
  //     }
  //   }
  //   return 0;
  // }


}
