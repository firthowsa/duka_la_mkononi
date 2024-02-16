import 'package:duka_la_mkononi/src/domain/cart/models/cart.dart';

import '../../../utils/resources/data_state.dart';

abstract class CartApiRepository{
  Future<DataState<List<Cart>>> getCarts();

}