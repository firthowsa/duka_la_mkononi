import 'package:duka_la_mkononi/src/domain/models/product.dart';

import '../../../domain/repositories/database_repository.dart';
import '../data_sources/local/app_database.dart';

class DatabaseRepositoryImpl implements DatabaseRepository {
  final AppDatabase _appDatabase;

  DatabaseRepositoryImpl(this._appDatabase);

  @override
  Future<List<Product>> getSavedProducts() async {
    return _appDatabase.productDao.getAllProducts();
  }

  @override
  Future<void> removeProduct(Product product) async {
    return _appDatabase.productDao.deleteProduct(product);
  }

  @override
  Future<void> saveProduct(Product product) async {
    return _appDatabase.productDao.insertProduct(product);
  }
}