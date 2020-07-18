import 'package:flutter/material.dart';

const InputDecoration kInputDecoration = InputDecoration(
  hintText: '',
  contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  ),
  focusColor: kPrimaryColor,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  hintStyle: TextStyle(color: Colors.grey),
);

const kInputTextColor = TextStyle(color: Colors.black87);
const kPrimaryColor = Color(0xFF4DB050);
