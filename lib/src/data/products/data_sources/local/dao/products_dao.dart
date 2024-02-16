import 'package:duka_la_mkononi/src/domain/models/product.dart';
import 'package:floor/floor.dart';

import '../../../../../utils/constants/strings.dart';

@dao
abstract class ProductDao {
  @Query('SELECT * FROM $productsTableName')
  Future<List<Product>> getAllProducts();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertProduct(Product product);

  @delete
  Future<void> deleteProduct(Product product);
}