import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zartekmachinetest/data/cart.dart';

class ValueSelector extends StatefulWidget {
  @override
  _ValueSelectorState createState() => _ValueSelectorState();

  final String dishName;
  final Color color;

  ValueSelector(this.dishName, this.color);
}

class _ValueSelectorState extends State<ValueSelector> {
  int value = 0;

  @override
  // TODO: implement widget
  ValueSelector get widget => super.widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.tightFor(width: 150, height: 50),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: widget.color),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
              onTap: subtract,
              child: Icon(
                Icons.remove,
                color: Colors.white,
              )),
          Text(
            '${Provider.of<Cart>(context).getDishCount(widget.dishName)}',
            style: TextStyle(color: Colors.white),
          ),
          GestureDetector(
              onTap: add,
              child: Icon(
                Icons.add,
                color: Colors.white,
              )),
        ],
      ),
    );
  }

  void subtract() {
    Provider.of<Cart>(context).removeFromCart(widget.dishName);
  }

  void add() {
    Provider.of<Cart>(context).addToCart(widget.dishName);
  }
}
