import 'package:duka_la_mkononi/src/domain/models/product.dart';
import 'package:duka_la_mkononi/src/domain/models/requests/product_request.dart';

import '../../utils/resources/data_state.dart';
import '../models/response/product_response.dart';

abstract class ApiRepository{
  Future<DataState<List<Product>>> getProduct();

}