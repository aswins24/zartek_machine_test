import 'package:flutter/material.dart';
import 'package:zartekmachinetest/widgets/item_number_selector.dart';

class DishCard extends StatefulWidget {
  final int dishType;
  final String dishName;
  final double dishPrice;
  final String dishDescription;
  final String image;
  final double calories;
  final bool addOn;

  @override
  _DishCardState createState() => _DishCardState();

  DishCard(
      {this.dishType,
      this.dishName,
      this.dishPrice,
      this.dishDescription,
      this.image,
      this.calories,
      this.addOn});
}

class _DishCardState extends State<DishCard> {
  int dishType;
  String dishName;
  double dishPrice;
  String dishDescription;
  String image;
  double calories;
  bool addOn;

  @override
  // TODO: implement widget
  DishCard get widget => super.widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 20, right: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              constraints: BoxConstraints.expand(width: 20, height: 20),
              child: dishType == 2
                  ? Image(image: AssetImage('assets/images/veg.png'))
                  : Image(image: AssetImage('assets/images/non-veg.jpg')),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              padding: EdgeInsets.only(right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    dishName,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'INR $dishPrice',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(
                          '$calories calories',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      child: Text(
                        dishDescription.toString(),
                        style: TextStyle(color: Colors.black26),
                      ),
                    ),
                  ),
                  ValueSelector(dishName, Colors.green.shade400),
                  SizedBox(
                    height: 20,
                  ),
                  Visibility(
                    child: Text(
                      'Customization Available',
                      style: TextStyle(color: Colors.red),
                    ),
                    visible: addOn,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              constraints: BoxConstraints.tightFor(width: 100, height: 70),
              child: Image(
                image: image.trim().length > 0
                    ? NetworkImage(
                        image.trim(),
                      )
                    : AssetImage('assets/images/image_not_found.png'),
                fit: BoxFit.fill,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    dishType = widget.dishType;
    dishDescription = widget.dishDescription;
    dishPrice = widget.dishPrice;
    dishName = widget.dishName;
    image = widget.image;
    calories = widget.calories;
    addOn = widget.addOn;
  }
}
