

import '../models/product.dart';

abstract class DatabaseRepository {
  Future<List<Product>> getSavedProducts();

  Future<void> saveProduct(Product product);

  Future<void> removeProduct(Product product);
}