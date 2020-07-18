import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zartekmachinetest/data/cart.dart';
import 'package:zartekmachinetest/data/categories.dart';
import 'package:zartekmachinetest/data/category_list.dart';
import 'package:zartekmachinetest/data/dish_list.dart';
import 'package:zartekmachinetest/helper/mock_network.dart';
import 'package:zartekmachinetest/screens/check_out_screen.dart';
import 'package:zartekmachinetest/widgets/dish_list_category.dart';
import 'package:zartekmachinetest/widgets/navigation_widget.dart';

class MainScreen extends StatefulWidget {
  static String id = 'main_screen';
  final FirebaseUser user;
  @override
  _MainScreenState createState() => _MainScreenState();

  MainScreen(this.user);
}

class _MainScreenState extends State<MainScreen> {
  FirebaseUser user;

  @override
  // TODO: implement widget
  MainScreen get widget => super.widget;

  @override
  void initState() {
    super.initState();
    user = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Provider.of<CategoryList>(context).categoryListLength,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          bottom: TabBar(
            indicatorColor: Color(0xFFD56379),
            labelColor: Color(0xFFD56379),
            isScrollable: true,
            tabs: getCategoryTabs(context),
          ),
          backgroundColor: Colors.white,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: new Container(
                height: 150.0,
                width: 30.0,
                child: new Stack(
                  children: <Widget>[
                    new IconButton(
                      icon: new Icon(
                        Icons.shopping_cart,
                        color: Colors.black38,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, CheckOutScreen.id);
                      },
                    ),
                    Positioned(
                      child: new Stack(
                        children: <Widget>[
                          new Icon(Icons.brightness_1,
                              size: 20.0, color: Colors.red[800]),
                          new Positioned(
                              top: 3.0,
                              right: 4.0,
                              child: new Center(
                                child: new Text(
                                  Provider.of<Cart>(context)
                                      .cartLength()
                                      .toString(),
                                  style: new TextStyle(
                                      color: Colors.white,
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          iconTheme: IconThemeData(color: Colors.black),
        ),
        drawer: NavigationDrawer(
          user: user,
        ),
        body: TabBarView(
            children: CategoryBasedDishList().separatedDishList(context)),
      ),
    );
  }

  List<Tab> getCategoryTabs(context) {
    List<Tab> categoryTabs = [];

    List<Category> categories = Provider.of<CategoryList>(context).categoryList;

    for (var category in categories) {
      categoryTabs.add(
        Tab(
          child: Container(
            width: 150,
            child: Text(
              category.categoryName.toString(),
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }
    return categoryTabs;
  }
}
