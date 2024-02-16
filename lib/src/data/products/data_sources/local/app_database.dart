import 'package:duka_la_mkononi/src/data/products/data_sources/local/converters/category_converter.dart';
import 'package:duka_la_mkononi/src/data/products/data_sources/local/converters/rating_converter.dart';
import 'package:duka_la_mkononi/src/data/products/data_sources/local/dao/products_dao.dart';
import 'package:duka_la_mkononi/src/domain/models/product.dart';
import 'package:floor/floor.dart';
import 'dart:async';

import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@TypeConverters([RatingConverter,CategoryConverter])
@Database(version: 1, entities: [Product])
abstract class AppDatabase extends FloorDatabase {
  ProductDao get productDao;
}