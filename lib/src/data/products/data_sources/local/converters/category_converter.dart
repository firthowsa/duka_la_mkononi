import 'package:floor/floor.dart';

import '../../../../../domain/models/product.dart';

class CategoryConverter extends TypeConverter<Category, String> {
  @override
  Category decode(String databaseValue) {
    return categoryValues.map[databaseValue]!;
  }

  @override
  String encode(Category? value) {
    return categoryValues.reverse[value]!;
  }
}