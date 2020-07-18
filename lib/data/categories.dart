class Category {
  String _categoryName;

  String get categoryName => _categoryName;

  Category({categoryName}) {
    _categoryName = categoryName;
  }

  set categoryName(String value) {
    _categoryName = value;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Category &&
          runtimeType == other.runtimeType &&
          _categoryName == other._categoryName;

  @override
  int get hashCode => _categoryName.hashCode;

  @override
  String toString() {
    return 'Category{_categoryName: $_categoryName}';
  }
}
