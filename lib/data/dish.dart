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

  set dishType(int value) {
    _dishType = value;
  }

  String get dishCategory => _dishCategory;

  set dishCategory(String value) {
    _dishCategory = value;
  }

  String get dishName => _dishName;

  String get dishImage => _dishImage;

  set dishImage(String value) {
    _dishImage = value;
  }

  bool get addOns => _addOns;

  set addOns(bool value) {
    _addOns = value;
  }

  double get dishCalories => _dishCalories;

  set dishCalories(double value) {
    _dishCalories = value;
  }

  double get price => _price;

  set price(double value) {
    _price = value;
  }

  String get dishDescription => _dishDescription;

  set dishDescription(String value) {
    _dishDescription = value;
  }

  set dishName(String value) {
    _dishName = value;
  }

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
