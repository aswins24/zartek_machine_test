import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zartekmachinetest/data/categories.dart';
import 'package:zartekmachinetest/data/category_list.dart';
import 'package:zartekmachinetest/data/dish_list.dart';
import 'package:zartekmachinetest/widgets/dish_card.dart';

import '../data/categories.dart';

class CategoryBasedDishList {
  List<Widget> dishCardList = [];

  List<Widget> separatedDishList(context) {
    List<Category> categories = Provider.of<CategoryList>(context).categoryList;

    for (var category in categories) {
      dishCardList.add(getDishList(category.categoryName));
    }
    return dishCardList;
  }

  Widget getDishList(String category) {
    return Consumer<DishList>(
        builder: (BuildContext context, DishList value, Widget child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          if (category == value.dishList[index].dishCategory)
            return DishCard(
              dishType: value.dishList[index].dishType,
              dishName: value.dishList[index].dishName,
              dishPrice: value.dishList[index].price,
              dishDescription: value.dishList[index].dishDescription,
              calories: value.dishList[index].dishCalories,
              image: value.dishList[index].dishImage,
              addOn: value.dishList[index].addOns,
            );
          else
            return Container();
        },
        itemCount: value.dishListLength,
      );
    });
  }
}
