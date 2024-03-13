


import '../../utils/resources/data_state.dart';
import '../models/product.dart';

abstract class ApiRepository{
  Future<DataState<List<Product>>> getProduct();

}