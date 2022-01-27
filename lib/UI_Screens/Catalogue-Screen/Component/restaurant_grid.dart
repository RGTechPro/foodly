import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:schaffen_task/Components/custom_text.dart';
import 'package:schaffen_task/Components/rating.dart';

import 'package:schaffen_task/Models/restaurant_model.dart';
class RestaurantGrid extends StatefulWidget {
  const RestaurantGrid({Key? key}) : super(key: key);

  @override
  _RestaurantGridState createState() => _RestaurantGridState();
}

class _RestaurantGridState extends State<RestaurantGrid> {
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      shrinkWrap: true,
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 80),
      crossAxisCount: 4,
      itemCount: images.length,
      itemBuilder: (BuildContext context, int index) => GestureDetector(
        onTap: (){},
        child: Container(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Colors.black,
            child: Column(
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(images[index])),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    children: [
                      CustomText(
                          text: food_name[index],
                          fontSize: 15,
                          color: Colors.amberAccent,
                          position: TextAlign.left
                      ),
                      CustomText(
                          text: prices[index],
                          fontSize: 17,
                          color: Colors.amberAccent,
                          position: TextAlign.left
                      ),
                      CustomRatingBar(rating:rating[index] ),
                    ],
                  ),
                ),
              ],
            ),
            elevation: 20,
          ),
        ),
      ),
      staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}
