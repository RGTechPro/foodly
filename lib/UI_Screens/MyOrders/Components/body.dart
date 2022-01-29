import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:schaffen_task/UI_Screens/MyOrders/Components/order_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
        body: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('orders')
                .doc(user!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                    child: Text(
                  'Something went wrong',
                ));
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                );
              }
              if (!snapshot.hasData) {
                return Center(
                  child: Text(
                    'No Order found!',
                  ),
                );
              }
              try {
                List tempDoc = snapshot.data!['orders'];
                if (tempDoc.length == 0) {
                  return Center(
                    child: Text(
                      'No Orders found!',
                    ),
                  );
                }

                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: tempDoc.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OrderCard(
                          date: tempDoc[index]['orderTime'],
                          isDelivered: false,
                          restaurant: tempDoc[index]['restro'],
                          orderId: tempDoc[index]['orderId'],
                        ),
                      );
                    });
              } catch (e) {
                if (e.toString().contains('field does not exist') ||
                    e.toString().contains('get a field')) {
                  return Center(
                    child: Text(
                      'No Orders found!',
                    ),
                  );
                }
                return Center(
                  child: Text(
                    'Error: $e',
                  ),
                );
              }
            }));
  }
}
