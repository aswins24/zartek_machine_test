class Dish {
  int _dishType;
  String _dishName;
  String _dishDescription;
  double _dishCalories;
  bool _addOns;
  String _dishImage;
  double _price;
  String _dishCategory;

  Dish(
      this._dishType,
      this._dishName,
      this._dishDescription,
      this._dishCalories,
      this._addOns,
      this._dishImage,
      this._price,
      this._dishCategory);

  int get dishType => _dishType;

  String get dishName => _dishName;

  String get dishCategory => _dishCategory;

  double get price => _price;

  String get dishImage => _dishImage;

  bool get addOns => _addOns;

  double get dishCalories => _dishCalories;

  String get dishDescription => _dishDescription;

  @override
  String toString() {
    return 'Dish{_dishType: $_dishType, _dishName: $_dishName, _dishDescription: $_dishDescription, _dishCalories: $_dishCalories, _addOns: $_addOns, _dishImage: $_dishImage}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Dish &&
          runtimeType == other.runtimeType &&
          _dishType == other._dishType &&
          _dishName == other._dishName &&
          _dishDescription == other._dishDescription &&
          _dishCalories == other._dishCalories &&
          _addOns == other._addOns &&
          _dishImage == other._dishImage;

  @override
  int get hashCode =>
      _dishType.hashCode ^
      _dishName.hashCode ^
      _dishDescription.hashCode ^
      _dishCalories.hashCode ^
      _addOns.hashCode ^
      _dishImage.hashCode;
}
