import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:duka_la_mkononi/src/domain/cart/models/cart.dart';
import 'package:duka_la_mkononi/src/domain/cart/repositories/cart_api_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../utils/resources/data_state.dart';
import '../../products/cubits/base/base_cubit.dart';

part 'carts_state.dart';

class CartsCubit extends BaseCubit<CartsState, List<Cart>> {
  final CartApiRepository _cartApiRepository;

  CartsCubit(this._cartApiRepository)
      : super(const RemoteCartsLoading(), []);

  //int _page = 1;

  Future<void> getCarts() async {
    if (isBusy) return;

    await run(() async {
      final response = await _cartApiRepository.getCarts();

      if (response is DataSuccess) {
        final products = response.data!;
        final noMoreData = products.length < 20;


        data.addAll(products);
        //_page++;

        emit(RemoteCartsSuccess(carts: data, noMoreData: noMoreData));
      } else if (response is DataFailed) {
        emit(RemoteCartsFailed(error: response.error));
      }
    });
  }}
