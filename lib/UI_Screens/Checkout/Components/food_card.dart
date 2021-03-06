import 'package:flutter/material.dart';
import 'package:schaffen_task/Constants/size_config.dart';
import 'package:schaffen_task/Constants/ui.dart';
import 'package:schaffen_task/Provider/provider.dart';
import 'package:provider/provider.dart';

class FoodCard extends StatefulWidget {
  FoodCard({Key? key, this.isVeg, this.price, this.food, this.itemCount = 1})
      : super(key: key);
  double? price;
  String? food;
  bool? isVeg;
  int itemCount;
  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  int order = 1;
  @override
  Widget build(BuildContext context) {
    final _counter = Provider.of<CounterModel>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        //  VegBadgeView(isVeg: widget.isVeg!,),
        UIHelper.horizontalSpaceSmall(),
        SizedBox(
          width: getProportionateScreenWidth(150),
          child: Text(
            widget.food!,
            style: Theme.of(context).textTheme.bodyText1,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        UIHelper.horizontalSpaceSmall(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          height: 35.0,
          width: 100.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              InkWell(
                child: const Icon(Icons.remove, color: Colors.green),
                onTap: () {
                  _counter.totalSum >= 0 && order > 1
                      ? _counter.decrement(price: widget.price)
                      : null;

                  order > 1 ? decrement() : null;
                },
              ),
              const Spacer(),
              Text('${widget.itemCount}',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(fontSize: 16.0)),
              const Spacer(),
              InkWell(
                child: const Icon(Icons.add, color: Colors.green),
                onTap: () {
                  increment();
                  _counter.increment(price: widget.price);
                },
              )
            ],
          ),
        ),
        UIHelper.horizontalSpaceSmall(),
        Text(
          '${widget.itemCount * widget.price!}',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }

  void increment({int? price}) {
    setState(() {
      order++;
      widget.itemCount++;
    });
  }

  void decrement({int? price}) {
    setState(() {
      order--;
      widget.itemCount--;
    });
  }
}
