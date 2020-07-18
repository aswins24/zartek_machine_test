import 'package:flutter/material.dart';
import 'package:zartekmachinetest/widgets/bill.dart';
import 'package:zartekmachinetest/widgets/round_text_image_button.dart';
import 'package:zartekmachinetest/widgets/rounded_button.dart';

class CheckOutScreen extends StatelessWidget {
  static String id = 'check_out_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black38),
        title: Text(
          'Order Summary',
          style: TextStyle(color: Colors.black26),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 10, right: 15, top: 30, bottom: 10),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: BillWidget(),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 100),
              child: RoundedButton(
                buttonColor: Colors.green.shade900,
                text: 'Place Order',
                onPress: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
