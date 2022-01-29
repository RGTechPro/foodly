import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schaffen_task/Components/rating.dart';
import 'package:schaffen_task/Constants/ui.dart';
import 'package:schaffen_task/Models/restaurant_detail.dart';
import 'package:schaffen_task/Provider/cart.dart';
import 'package:schaffen_task/Provider/provider.dart';
import 'package:schaffen_task/UI_Screens/Restaurant_Details/Components/add_button.dart';
import 'package:schaffen_task/UI_Screens/Restaurant_Details/Components/veg_portion.dart';
import 'package:schaffen_task/Provider/restro.dart';
import 'package:schaffen_task/Models/restaurant_model.dart';

class RecommendedFoodView extends StatefulWidget {
  const RecommendedFoodView({Key? key}) : super(key: key);

  @override
  State<RecommendedFoodView> createState() => _RecommendedFoodViewState();
}

class _RecommendedFoodViewState extends State<RecommendedFoodView> {
  bool? isAdd = false;
  @override
  Widget build(BuildContext context) {
    var providerL = Provider.of<Restro>(context);
    var provider = Provider.of<Restro>(context);
    var _counter = Provider.of<CounterModel>(context);
    final foods = _counter.isVeg
        ? RestaurantDetail.getBreakfast()
        : RestaurantDetail.nonVegDish();
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          _counter.isVeg
              ? provider.restro!.veg.length
              : provider.restro!.non_veg.length,
          (index) => Container(
            margin: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      _counter.isVeg
                          ? provider.restro!.veg[index].i_image
                          : provider.restro!.non_veg[index].i_image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                UIHelper.verticalSpaceExtraSmall(),
                SizedBox(
                  height: 90.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            '${_counter.isVeg ? provider.restro!.veg[index].i_votes : provider.restro!.non_veg[index].i_votes} VOTES',
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 10.0,
                                      color: Colors.grey[700],
                                    ),
                          ),
                          CustomRatingBar(rating: 4, size: 14),
                        ],
                      ),
                      UIHelper.verticalSpaceExtraSmall(),
                      Row(
                        children: <Widget>[
                          VegBadgeView(),
                          UIHelper.horizontalSpaceExtraSmall(),
                          Flexible(
                            child: Text(
                              _counter.isVeg
                                  ? provider.restro!.veg[index].i_name
                                  : provider.restro!.non_veg[index].i_name,
                              maxLines: 1,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      UIHelper.verticalSpaceMedium(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                              '₹${_counter.isVeg ? provider.restro!.veg[index].i_price.toString() : provider.restro!.non_veg[index].i_price.toString()}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontSize: 14.0)),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  Provider.of<Cart>(context,listen: false).restroData =
                                      provider.restro;
                                  Provider.of<Cart>(context,listen: false).cartList.add(
                                      _counter.isVeg
                                          ? provider.restro!.veg[index]
                                          : provider.restro!.non_veg[index]);
                                final snackBar = const SnackBar(content: Text('Item Added to Cart!'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                //  isAdd = !isAdd!;
                                });
                              },
                              child: AddBtnView(
                                isAdd: isAdd!,
                              ))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
