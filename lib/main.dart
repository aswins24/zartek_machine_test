import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zartekmachinetest/data/cart.dart';
import 'package:zartekmachinetest/data/category_list.dart';
import 'package:zartekmachinetest/data/dish_list.dart';
import 'package:zartekmachinetest/screens/check_out_screen.dart';
import 'package:zartekmachinetest/screens/home-screen.dart';
import 'package:zartekmachinetest/screens/main_screen.dart';
import 'package:zartekmachinetest/screens/phone_logIn_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DishList>(
      create: (context) => DishList(),
      child: ChangeNotifierProvider<Cart>(
        create: (context) => Cart(),
        child: ChangeNotifierProvider<CategoryList>(
          create: (context) => CategoryList(),
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData.light(),
            routes: {
              HomeScreen.id: (context) => HomeScreen(),
              CheckOutScreen.id: (context) => CheckOutScreen(),
              LoginScreen.id: (context) => LoginScreen(),
            },
            initialRoute: HomeScreen.id,
          ),
        ),
      ),
    );
  }
}
