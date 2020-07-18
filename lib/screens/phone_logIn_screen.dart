import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:zartekmachinetest/data/category_list.dart';
import 'package:zartekmachinetest/data/dish_list.dart';
import 'package:zartekmachinetest/helper/mock_network.dart';
import 'package:zartekmachinetest/screens/main_screen.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'login_screen';
  final _phoneController = TextEditingController();
  final _passController = TextEditingController();
  var _phoneAuthCredential;
  FirebaseUser _firebaseUser;
  var _verificationId;
  final MockNetwork mockNetwork = MockNetwork();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(32),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Login",
              style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 36,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: Colors.grey[200])),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: Colors.grey[300])),
                  filled: true,
                  fillColor: Colors.grey[100],
                  hintText: "Phone Number"),
              controller: _phoneController,
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: Colors.grey[200])),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: Colors.grey[300])),
                  filled: true,
                  fillColor: Colors.grey[100],
                  hintText: "Password"),
              keyboardType: TextInputType.number,
              obscureText: true,
              controller: _passController,
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: double.infinity,
              child: FlatButton(
                child: Text("Login"),
                textColor: Colors.white,
                padding: EdgeInsets.all(16),
                onPressed: () {
                  //code for sign in
                  _submitPhoneNumber();
                },
                color: Colors.blue,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: double.infinity,
              child: FlatButton(
                child: Text("Submit OTP"),
                textColor: Colors.white,
                padding: EdgeInsets.all(16),
                onPressed: () {
                  //code for sign in
                  _submitOTP(context);
                },
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Future<void> _submitPhoneNumber() async {
    /// NOTE: Either append your phone number country code or add in the code itself
    /// Since I'm in India we use "+91 " as prefix `phoneNumber`
    String phoneNumber = "+91 " + _phoneController.text.toString().trim();
    print(phoneNumber);

    /// The below functions are the callbacks, separated so as to make code more readable
    void verificationCompleted(AuthCredential phoneAuthCredential) {
      print('verificationCompleted');
      this._phoneAuthCredential = phoneAuthCredential;
      print(phoneAuthCredential);
    }

    void verificationFailed(AuthException error) {
      print(error);
    }

    void codeSent(String verificationId, [int code]) {
      this._verificationId = verificationId;
      print('codeSent');
    }

    void codeAutoRetrievalTimeout(String verificationId) {
      print('codeAutoRetrievalTimeout');
    }

    await FirebaseAuth.instance.verifyPhoneNumber(
      /// Make sure to prefix with your country code
      phoneNumber: phoneNumber,

      /// `seconds` didn't work. The underlying implementation code only reads in `milliseconds`
      timeout: Duration(milliseconds: 10000),

      /// If the SIM (with phoneNumber) is in the current device this function is called.
      /// This function gives `AuthCredential`. Moreover `login` function can be called from this callback
      verificationCompleted: verificationCompleted,

      /// Called when the verification is failed
      verificationFailed: verificationFailed,

      /// This is called after the OTP is sent. Gives a `verificationId` and `code`
      codeSent: codeSent,

      /// After automatic code retrival `tmeout` this function is called
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    ); // All the callbacks are above
  }

  void _submitOTP(context) {
    /// get the `smsCode` from the user
    String smsCode = _passController.text.toString().trim();

    /// when used different phoneNumber other than the current (running) device
    /// we need to use OTP to get `phoneAuthCredential` which is inturn used to signIn/login
    this._phoneAuthCredential = PhoneAuthProvider.getCredential(
        verificationId: this._verificationId, smsCode: smsCode);

    _login(context).whenComplete(() {
      if (_firebaseUser != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(_firebaseUser),
          ),
        ).then((value) => Navigator.pop(context));
      }
    });
  }

  Future<void> _login(context) async {
    /// This method is used to login the user
    /// `AuthCredential`(`_phoneAuthCredential`) is needed for the signIn method
    /// After the signIn method from `AuthResult` we can get `FirebaserUser`(`_firebaseUser`)
    try {
      await FirebaseAuth.instance
          .signInWithCredential(this._phoneAuthCredential)
          .then((AuthResult authRes) {
        _firebaseUser = authRes.user;
        print(_firebaseUser.toString());

        getHomeScreen(context);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _logout() async {
    /// Method to Logout the `FirebaseUser` (`_firebaseUser`)
    try {
      // signout code
      await FirebaseAuth.instance.signOut();
      _firebaseUser = null;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getHomeScreen(context) async {
    try {
      var response = await mockNetwork.getMockData();

      if (response != null) {
        var responseList = response[0];
        var tableMenuList = responseList['table_menu_list'];

        for (var tableMenu in tableMenuList) {
          String category = tableMenu['menu_category'];
          print(category);
          var dishList = tableMenu['category_dishes'];

          for (var dish in dishList) {
            String dishName = dish['dish_name'];
            String dishImage = dish['dish_image'];
            int dishType = dish['dish_Type'];
            String dishDescription = dish['dish_description'];

            double dishCalories = dish['dish_calories'];

            double price = dish['dish_price'];
            Map<String, dynamic> addOns = Map();
            try {
              addOns = dish['addonCat'][0];
              print(addOns);
            } catch (e) {
              print(e);
            }
            Provider.of<DishList>(context).addDish(
                dishType,
                dishName,
                dishDescription,
                dishCalories,
                addOns.isNotEmpty,
                dishImage,
                price,
                category);

            print(Provider.of<DishList>(context).dishList);
          }
          Provider.of<CategoryList>(
            context,
          ).addCategory(category);
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
