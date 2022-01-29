import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:nanoid/nanoid.dart';
import 'package:schaffen_task/Models/address.dart';
import 'package:schaffen_task/Models/product_data.dart';
import 'package:schaffen_task/Provider/address_data.dart';
import 'package:schaffen_task/Provider/cart.dart';
import 'package:schaffen_task/UI_Screens/Order_Tracker/order_track.dart';
import '../snackbar.dart';

Future<void> placeOrder(BuildContext context) {
  final _firebase = FirebaseFirestore.instance;
  final addressProvider = Provider.of<AddressData>(context, listen: false);
  final cartProvider = Provider.of<Cart>(context, listen: false);
  DateTime now = DateTime.now();
  String date = DateFormat('dd-MM-yyyy').format(now);
  String time = DateFormat.jm().format(DateTime.now());
  String orderTime = date + ' ' + time;
// int addressIndex=addressProviderL.addressList.length-addressProviderL.selectedIndex-1;
  Address? tempAddress = addressProvider.selected;
  String name = tempAddress!.name;
  String address = tempAddress.address;
  String mobileNumber = tempAddress.mobileNumber;
  String? city = tempAddress.city;
  User? user = FirebaseAuth.instance.currentUser;

  var orderId = customAlphabet('1234567890', 15);
  print(orderId);
  Map<String, String> tempAddressData = {
    'name': name,
    'mobileNumber': mobileNumber,
    'address': address,
    'city': city!
  };
  List<ProductData> finalCart = cartProvider.cartList;

  String totalAmount = cartProvider.totalAmount.toString();
  String discount = cartProvider.discount.toString();
  String restro = cartProvider.restroData!.r_name;
  List<Map> myData = [
    {
      'orderId': orderId,
      'orderStatus': 'Order Placed',
      'orderTime': orderTime,
      'totalAmount': totalAmount,
      'discount': discount,
      'address': tempAddressData,
      'restro': restro
    },
  ];
  cartProvider.data = myData;
  return _firebase.collection('orders').doc(user!.uid).set(
      {'orders': FieldValue.arrayUnion(myData)},
      SetOptions(merge: true)).then((value) {
    Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => OrderTracker()));
    // cartProvider.clearCartData();
    // cartProvider.a.clear();
  }).catchError(
      (error) => showSnackBar('Failed to place the order. $error', context));
}
