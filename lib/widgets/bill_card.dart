import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zartekmachinetest/data/cart.dart';
import 'package:zartekmachinetest/widgets/item_number_selector.dart';

class BillCard extends StatelessWidget {
  final String dishName;
  final double dishPrice;
  final double dishCalories;
  final int dishType;
  double totalPrice;

  BillCard({this.dishName, this.dishPrice, this.dishCalories, this.dishType});

  @override
  Widget build(BuildContext context) {
    var numberOfSameDish =
        Provider.of<Cart>(context).numberOfSameDishes[dishName];
    if (numberOfSameDish != null) {
      totalPrice = dishPrice * numberOfSameDish;
    }
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.shade700,
              offset: Offset(1.0, 1.0),
              blurRadius: 5.0,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20, left: 5),
              constraints: BoxConstraints.tightFor(width: 20, height: 20),
              child: Image(
                image: dishType == 2
                    ? AssetImage('assets/images/veg.png')
                    : AssetImage('assets/images/non-veg.jpg'),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      constraints: BoxConstraints.tightFor(width: 100),
                      child: Text(dishName.toString())),
                  SizedBox(
                    height: 10,
                  ),
                  Text('INR $dishPrice'),
                  SizedBox(
                    height: 10,
                  ),
                  Text('$dishCalories Calories'),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              constraints: BoxConstraints.tightFor(width: 125),
              child: ValueSelector('$dishName', Colors.green.shade900),
            ),
            Flexible(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'INR $totalPrice',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
