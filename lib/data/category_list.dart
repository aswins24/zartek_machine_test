import 'package:flutter/cupertino.dart';
import 'package:zartekmachinetest/data/categories.dart';

class CategoryList extends ChangeNotifier {
  List<Category> _categoryList = [];

  void addCategory(String categoryData) {
    Category category = Category(categoryName: categoryData);
    _categoryList.add(category);
    notifyListeners();
  }

  List<Category> get categoryList {
    return _categoryList;
  }

  int get categoryListLength {
    return _categoryList.length;
  }

  void clearList() {
    this._categoryList.clear();
    notifyListeners();
  }
}
