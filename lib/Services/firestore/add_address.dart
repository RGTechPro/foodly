
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:schaffen_task/Provider/address_data.dart';

import '../snackbar.dart';

Future? addAddress(BuildContext context, String name, String address,
    String mobileNumber, bool isEdit, String city) {
  User? user = FirebaseAuth.instance.currentUser;
  var addressProvider = Provider.of<AddressData>(context, listen: false);
  final _firebase = FirebaseFirestore.instance;
  int flag1 = 0;

  List<Map<String, String>> myData = [
    {
      'name': name,
      'mobileNumber': mobileNumber,
      'address': address,
      'city': city
    },
  ];
  print(myData);

 
    return _firebase.collection('users').doc(user!.uid).update(
      {'address': FieldValue.arrayUnion(myData)},
    ).then((value) {
      Navigator.pop(context);
      addressProvider.isAddress = true;
    
        showSnackBar('Successfully added the address!', context);
    
    }).catchError((error) =>
        showSnackBar('Failed to add a new address. $error', context));
 
}
