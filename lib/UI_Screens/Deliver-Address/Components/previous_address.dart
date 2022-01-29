import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schaffen_task/Components/custom_text.dart';
import 'package:schaffen_task/Constants/constants.dart';
import 'package:schaffen_task/Constants/size_config.dart';
import 'package:schaffen_task/Models/address.dart';
import 'package:schaffen_task/Provider/address_data.dart';
import 'package:schaffen_task/UI_Screens/Deliver-Address/Components/address_card.dart';
import 'package:schaffen_task/UI_Screens/Deliver-Address/address.dart';

class PreviousAddress extends StatelessWidget {

  static String routeName = "/previous";
    User? user = FirebaseAuth.instance.currentUser;
  final _firebase = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
 final addressProvider = Provider.of<AddressData>(context, listen: false);
  final addressProviderL = Provider.of<AddressData>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: CustomText(
          text: 'My Addresses',
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: InkWell(
          onTap: ()
          {
            Navigator.pushNamed(context, DeliAddress.routeName);
          },
          child: Container(
            height: getProportionateScreenHeight(50),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Colors.greenAccent,
            ),
            child: Center(
              child: CustomText(
                  text: 'Add New Address',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,

              ),
            ),
          ),
        ),
      ),

        body: StreamBuilder<DocumentSnapshot>(
          stream:  _firebase.collection('users').doc(user!.uid).snapshots(),
          builder: (context, snapshot) {

  if (snapshot.hasError) {
                      return Center(
                          child: Text(
                        'Something went wrong',
                        
                      ));
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    try {
                      List tempDoc = snapshot.data!['address'];
                      List<Address> tempList = [];
                      for (int i = 0; i < tempDoc.length; i++) {
                        tempList.insert(
                            0,
                            Address(
                                name: tempDoc[i]['name'],
                                mobileNumber: tempDoc[i]['mobileNumber'],
                                address: tempDoc[i]['address'],
                                city: tempDoc[i]['city']));
                      }
                      if (tempList.isEmpty) {
                        return Expanded(
                          child: Center(
                            child: Text(
                              'No address found! Please add a new address!',
                              textAlign: TextAlign.center,
                            
                            ),
                          ),
                        );
                      }

                      addressProvider.addressList = tempList;



            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
                itemCount: addressProviderL.addressList.length,
                itemBuilder: (context, index) {

                  return AddressCard(
                    address: addressProviderL.addressList[index].address,
                    phoneNo: addressProviderL
                                    .addressList[index].mobileNumber,
                    firstName: addressProviderL.addressList[index].name,
                    lastName: ' ',
                    city:addressProviderL.addressList[index].city,
                  );
                });
          }
 catch (e) {
                      
                      if (e.toString().contains('field does not exist')) {
                        return Expanded(
                          child: Center(
                            child: Text(
                              'No address found! Please add a new address!',
                              textAlign: TextAlign.center,
                         
                            ),
                          ),
                        );
                      }
                      return Expanded(
                        child: Center(
                            child: Text(
                          'Error: $e',
               
                          textAlign: TextAlign.center,
                        )),
                      );
                    }


        }));
  }
}
