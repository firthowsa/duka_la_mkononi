import 'package:duka_la_mkononi/src/domain/models/product.dart';

abstract class DatabaseRepository {
  Future<List<Product>> getSavedProducts();

  Future<void> saveProduct(Product product);

  Future<void> removeProduct(Product product);
}