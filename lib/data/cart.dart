import 'package:flutter/cupertino.dart';


class Cart extends ChangeNotifier {
  List<String> dishesInCart = [];
  Map<String, int> numberOfSameDishes = Map();

  void addToCart(String dishName) {
    if (!dishesInCart.contains(dishName)) {
      dishesInCart.add(dishName);
      numberOfSameDishes[dishName] = 1;
    } else {
      numberOfSameDishes[dishName] = numberOfSameDishes[dishName] + 1;
    }
    notifyListeners();
  }

  void removeFromCart(String dishName) {
    if (numberOfSameDishes[dishName] > 0) {
      numberOfSameDishes[dishName] = numberOfSameDishes[dishName] - 1;
      if (numberOfSameDishes[dishName] == 0) {
        dishesInCart.remove(dishName);
      }
      notifyListeners();
    }
  }

  void clearCart() {
    numberOfSameDishes = Map();
    dishesInCart = [];
    notifyListeners();
  }

  int cartLength() {
    return dishesInCart.length;
  }

  int itemLength() {
    int count = 0;
    numberOfSameDishes.forEach((key, value) {
      count = count + value;
    });
    return count;
  }

  int getDishCount(String dishName) {
    if (numberOfSameDishes[dishName] == null) {
      return 0;
    }
    return numberOfSameDishes[dishName];
  }

  List<String> getDishesInCart() {
    return dishesInCart;
  }
}
