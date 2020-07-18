import 'package:flutter/material.dart';

class RoundedTextIconButton extends StatelessWidget {
  final List<Color> buttonColor;
  final String text;
  final Function onPress;
  final icon;

  RoundedTextIconButton({this.text, this.onPress, this.buttonColor, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Material(
        elevation: 5.0,
        //  color: buttonColor,
        borderRadius: BorderRadius.circular(30.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            gradient: LinearGradient(
                colors: buttonColor,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: Row(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Icon(
                    icon,
                    size: 25,
                    color: Colors.black45,
                  )
//                Image(
//                  image: AssetImage(icon),
//                  width: 25,
//                  height: 25,
//                ),
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
      ),
    );
  }
}
