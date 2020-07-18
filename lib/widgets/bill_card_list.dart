import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zartekmachinetest/data/cart.dart';
import 'package:zartekmachinetest/data/dish.dart';
import 'package:zartekmachinetest/data/dish_list.dart';
import 'package:zartekmachinetest/widgets/bill_card.dart';
import 'package:zartekmachinetest/widgets/total-amount.dart';

class BillCardList extends StatelessWidget {
  Dish dish;
  @override
  Widget build(BuildContext context) {
    List<Dish> dishes = Provider.of<DishList>(context).dishList;
    double totalAmount = 0;

    return Consumer<Cart>(
        builder: (BuildContext context, Cart value, Widget child) {
      return ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          if (index == value.cartLength()) {
            return getFinalAmount(totalAmount);
          }
          String dishName = value.dishesInCart[index];

          for (var dish in dishes) {
            if (dish.dishName == dishName) {
              this.dish = dish;
              totalAmount = totalAmount +
                  (this.dish.price *
                      Provider.of<Cart>(context).numberOfSameDishes[dishName]);
              break;
            }
          }

          return BillCard(
            dishName: dishName,
            dishPrice: dish.price,
            dishType: dish.dishType,
            dishCalories: dish.dishCalories,
          );
        },
        itemCount: value.cartLength() + 1,
      );
    });
  }
}
