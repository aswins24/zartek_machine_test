import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedTextImageButton extends StatelessWidget {
  final Color buttonColor;
  final String text;
  final Function onPress;
  final icon;

  RoundedTextImageButton(
      {this.text, this.onPress, this.buttonColor, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Material(
        elevation: 5.0,
        color: buttonColor,
        borderRadius: BorderRadius.circular(30.0),
        child: Row(
          children: <Widget>[
            Container(
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Image(
                  image: AssetImage(icon),
                  width: 25,
                  height: 25,
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                onPress();
              },
              minWidth: 200.0,
              height: 42.0,
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
