import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:zartekmachinetest/data/cart.dart';
import 'package:zartekmachinetest/screens/main_screen.dart';
import 'package:zartekmachinetest/screens/phone_logIn_screen.dart';
import 'package:zartekmachinetest/widgets/round_text_image_button.dart';
import 'package:zartekmachinetest/data/dish_list.dart';
import 'package:zartekmachinetest/helper/mock_network.dart';
import 'package:zartekmachinetest/data/category_list.dart';
import 'package:zartekmachinetest/widgets/rounded_text_icon_button.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final MockNetwork mockNetwork = MockNetwork();
  bool isBusy = false;
  FirebaseUser user;
  @override
  // TODO: implement widget
  HomeScreen get widget => super.widget;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isBusy,
      child: SafeArea(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(left: 40, right: 40, bottom: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 8,
                  child: Container(
                    width: 150,
                    height: 150,
                    child: Image(
                      image: AssetImage('assets/images/firebase.png'),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: RoundedTextImageButton(
                    buttonColor: Colors.blue,
                    icon: 'assets/images/google.png',
                    text: 'Google',
                    onPress: () {
                      Provider.of<CategoryList>(context).clearList();
                      Provider.of<Cart>(context).clearCart();
                      Provider.of<DishList>(context).clearDishList();
                      signInWithGoogle(context).then((value) {
                        if (value != null)
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainScreen(user),
                            ),
                          ).then((value) {
                            setState(() {
                              isBusy = false;
                            });
                          });

                        return null;
                      });
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: RoundedTextIconButton(
                    buttonColor: [
                      Color(0xFF7CD757),
                      Color(0xFF4CAF50),
                    ],
                    icon: Icons.phone,
                    text: 'Phone',
                    onPress: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> signInWithGoogle(context) async {
    setState(() {
      isBusy = true;
    });
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();

    assert(user.uid == currentUser.uid);

    await getHomeScreen(context);

    return user;
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
