import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schaffen_task/Constants/divider.dart';
import 'package:schaffen_task/Constants/size_config.dart';
import 'package:schaffen_task/Constants/ui.dart';
import 'package:schaffen_task/Provider/cart.dart';
import 'package:schaffen_task/Provider/provider.dart';
import 'package:schaffen_task/UI_Screens/Checkout/Components/delivery_address.dart';
import 'package:schaffen_task/UI_Screens/Checkout/Components/food_card.dart';
import 'package:schaffen_task/UI_Screens/Order_Tracker/Components/order_summary.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _counter = Provider.of<CounterModel>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _OrderView(),
                const CustomDividerView(dividerHeight: 15.0),
                BillDetailView(
                    deliverFee: 35,
                    taxes: 12,
                    total: _counter.totalSum.toDouble()),
                _DecoratedView(),
                AddressPaymentView(
                  address: 'Test',
                  total: _counter.totalSum.toDouble(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OrderView extends StatefulWidget {
  @override
  _OrderViewState createState() => _OrderViewState();
}

class _OrderViewState extends State<_OrderView> {
  int cartCount = 1;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Cart>(context);
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  provider.restroData!.r_image,
                  width: 100.0,
                ),
              ),
              UIHelper.horizontalSpaceSmall(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(provider.restroData!.r_name,
                      style: Theme.of(context).textTheme.subtitle2),
                  UIHelper.verticalSpaceExtraSmall(),
                  Container(
                    width: getProportionateScreenWidth(200),
                    child: Text(provider.restroData!.r_addr,
                        style: Theme.of(context).textTheme.bodyText1,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  )
                ],
              )
            ],
          ),
          UIHelper.verticalSpaceLarge(),
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: provider.cartList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FoodCard(
                    isVeg: true,
                    food: provider.cartList[index].i_name,
                    price: provider.cartList[index].i_price,
                    itemCount:provider.cartList[index].itemcount
                  ),
                );
              }),
          UIHelper.verticalSpaceExtraLarge(),
          CustomDividerView(
            dividerHeight: 1.0,
            color: Colors.grey[400],
          ),
          UIHelper.verticalSpaceMedium(),
          Row(
            children: <Widget>[
              Icon(Icons.library_books, color: Colors.grey[700]),
              UIHelper.horizontalSpaceSmall(),
              const Expanded(
                child: Text(
                    'Any restaurant request? We will try our best to convey it'),
              )
            ],
          ),
          UIHelper.verticalSpaceMedium(),
        ],
      ),
    );
  }
}

class _DecoratedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.0,
      color: Colors.grey[200],
    );
  }
}
