import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schaffen_task/Components/custom_text.dart';
import 'package:schaffen_task/Constants/size_config.dart';
import 'package:schaffen_task/Models/address.dart';
import 'package:schaffen_task/Provider/address_data.dart';
import 'package:schaffen_task/Services/firestore/place_order.dart';
import 'package:schaffen_task/UI_Screens/Order_Tracker/order_track.dart';

class AddressCard extends StatelessWidget {
  String? firstName;
  String? lastName;
  String? phoneNo;
  String? city;
  String? address;
  AddressCard(
      {Key? key,
      this.firstName,
      this.lastName,
      this.address,
      this.phoneNo,
      this.city})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: ()async {
              Address addresses = Address(
                  name: firstName! + ' ' + lastName!,
                  address: address!,
                  mobileNumber: phoneNo!,
                  city: city!);
              Provider.of<AddressData>(context, listen: false).selected =
                  addresses;
                      await   placeOrder(context);

              Navigator.pushNamed(context, OrderTracker.routeName);
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                margin: const EdgeInsets.all(10),
                width:
                    getProportionateScreenWidth(SizeConfig.screenWidth! / 1.2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: firstName! + ' ' + lastName!,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    CustomText(
                      text: '+91 $phoneNo',
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    CustomText(
                      text: address,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    CustomText(
                      text: city,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
