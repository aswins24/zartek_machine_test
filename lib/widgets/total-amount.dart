import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget getFinalAmount(double totalAmount) {
  return Container(
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
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 35, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Total Amount',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontSize: 20),
          ),
          Text(
            'INR ${double.parse((totalAmount).toStringAsFixed(2))}',
            style: TextStyle(color: Colors.green.shade400, fontSize: 20),
          )
        ],
      ),
    ),
  );
}
