import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'dish.dart';

class DishList extends ChangeNotifier {
  List<Dish> _dishList = [];

  void addDish(
      int dishType,
      String dishName,
      String dishDescription,
      double dishCalories,
      bool addOns,
      String dishImage,
      double price,
      String dishCategory) {
    Dish dish = Dish(dishType, dishName, dishDescription, dishCalories, addOns,
        dishImage, price, dishCategory);
    _dishList.add(dish);
    notifyListeners();
  }

  List<Dish> get dishList {
    return _dishList;
  }

  int get dishListLength {
    return _dishList.length;
  }

  void clearDishList() {
    dishList.clear();
    notifyListeners();
  }
}
