import 'dart:ffi';

import 'package:floor/floor.dart';

import '../../../../../domain/models/rating.dart';

class RatingConverter extends TypeConverter<Rating, String> {
  @override
  Rating decode(String databaseValue) {
    final List<String> results = databaseValue.toString().split(',');
    final double rate = double.parse(results.first);
    final int count = int.parse(results.last);
    return Rating(rate: rate, count: count);
  }

  @override
  String encode(Rating? value) {
    final String result = '${value?.rate},${value?.count}';
    return result;
  }
}

