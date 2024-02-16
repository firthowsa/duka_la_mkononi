import 'package:duka_la_mkononi/src/data/carts/data_sources/remote/cart_api_service.dart';
import 'package:duka_la_mkononi/src/domain/cart/models/cart.dart';

import '../../../domain/cart/repositories/cart_api_repository.dart';
import '../../../utils/resources/data_state.dart';
import '../../base/base_api_repository.dart';

class CartApiRepositoryImpl extends BaseApiRepository implements CartApiRepository {
  final CartApiService _cartApiService;

  CartApiRepositoryImpl(this._cartApiService);


  @override
  Future<DataState<List<Cart>>> getCarts() {
    // TODO: implement getProduct
    return getStateOf<List<Cart>>(
      request: () => _cartApiService.getCarts(),
    );
  }

}