import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schaffen_task/Components/custom_text.dart';
import 'package:schaffen_task/Constants/size_config.dart';
import 'package:schaffen_task/Models/cart_models.dart';
import 'package:schaffen_task/Provider/provider.dart';
import 'package:schaffen_task/UI_Screens/Checkout/Components/checkout_sumary_card.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _counter = Provider.of<CounterModel>(context);
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: 'Order Summary',
                  color: Colors.orange,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Container(
              width: SizeConfig.screenWidth! / 1.2,
              height: SizeConfig.screenHeight! / 3,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: CheckoutSummaryCard(
                        cart: demoCarts![index],
                      ),
                    );
                  }),
            ),
            const Divider(
              color: Colors.black,
              thickness: 1.3,
              indent: 20,
              endIndent: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomText(
                        text: 'Total Amount',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(50),
                      ),
                      CustomText(
                          text: '--',
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                      SizedBox(
                        width: getProportionateScreenWidth(20),
                      ),
                      CustomText(
                        text: 'Rs ${_counter.totalSum}',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blueAccent,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CustomText(
                          text: 'Discount',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                      SizedBox(
                        width: getProportionateScreenWidth(110),
                      ),
                      CustomText(
                          text: '--',
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                      SizedBox(
                        width: getProportionateScreenWidth(20),
                      ),
                      CustomText(
                        text: '0%',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.green,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CustomText(
                        text: 'Delivery Charges',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(30),
                      ),
                      CustomText(
                          text: '--',
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                      SizedBox(
                        width: getProportionateScreenWidth(20),
                      ),
                      CustomText(
                        text: 'Rs 0',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.blueAccent,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.black,
              thickness: 1.3,
              indent: 20,
              endIndent: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              child: Row(
                children: [
                  CustomText(
                    text: 'Payable Amount',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(35),
                  ),
                  CustomText(
                      text: '--', fontWeight: FontWeight.bold, fontSize: 20),
                  SizedBox(
                    width: getProportionateScreenWidth(20),
                  ),
                  CustomText(
                    text: 'Rs ${_counter.totalSum}',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.red,
                  ),
                ],
              ),
            )
          ]),
    );
  }
}
