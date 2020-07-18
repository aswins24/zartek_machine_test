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
        builder: (BuildContext context, Cart cart, Widget child) {
      return SingleChildScrollView(
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            if (index == cart.length()) {
              return getFinalAmount(totalAmount);
            }
            String dishName = cart.dishesInCart[index];

            for (var dish in dishes) {
              if (dish.dishName == dishName) {
                this.dish = dish;
                totalAmount = totalAmount +
                    (this.dish.price * cart.numberOfSameDishes[dishName]);
                break;
              }
            }

            if (cart.numberOfSameDishes[dishName] > 0) {
              return BillCard(
                dishName: dish.dishName,
                dishPrice: dish.price,
                dishType: dish.dishType,
                dishCalories: dish.dishCalories,
              );
            } else {
              return Container();
            }
          },
          itemCount: cart.length() + 1,
        ),
      );
    });
  }
}
