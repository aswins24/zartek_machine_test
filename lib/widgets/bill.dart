import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:zartekmachinetest/data/cart.dart';
import 'package:zartekmachinetest/widgets/bill_card_list.dart';

class BillWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 10, right: 20, left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
            margin: EdgeInsets.only(bottom: 1),
            decoration: BoxDecoration(
              color: Colors.green.shade900,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Container(
              child: Text(
                '${Provider.of<Cart>(context).cartLength()} Dishe(s) - ${Provider.of<Cart>(context).itemLength()} Item(s)',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          BillCardList(),
        ],
      ),
    );
  }
}
