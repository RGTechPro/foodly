import 'package:flutter/material.dart';
import 'package:schaffen_task/Components/custom_text.dart';
import 'package:schaffen_task/Constants/size_config.dart';

class DeliveryAddress extends StatelessWidget {
  String? name;
  String? phoneNo;
  String? address;
  DeliveryAddress({Key? key, this.name, this.address, this.phoneNo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              CustomText(
                text: 'Delivery Address',
                color: Colors.orange,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit,
                  ),
              color: Colors.purpleAccent[200],)
            ],
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              margin: EdgeInsets.all(10),
              width: getProportionateScreenWidth(SizeConfig.screenWidth! / 1.2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: name,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
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
                    text: '+91 $phoneNo',
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
