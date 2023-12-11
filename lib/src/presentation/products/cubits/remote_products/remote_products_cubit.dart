import 'package:dio/dio.dart';
import 'package:duka_la_mkononi/src/domain/models/product.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../domain/repositories/api_repository.dart';
import '../../../../utils/resources/data_state.dart';
import '../base/base_cubit.dart';

part 'remote_products_state.dart';

class RemoteProductsCubit extends BaseCubit<RemoteProductsState, List<Product>> {
  final ApiRepository _apiRepository;

  RemoteProductsCubit(this._apiRepository)
      : super(const RemoteProductsLoading(), []);

  //int _page = 1;

  Future<void> getProducts() async {
    if (isBusy) return;

    await run(() async {
      final response = await _apiRepository.getProduct();

      if (response is DataSuccess) {
        final products = response.data!;
        final noMoreData = products.length < 20;

        data.addAll(products);
        //_page++;

        emit(RemoteProductsSuccess(products: data, noMoreData: noMoreData));
      } else if (response is DataFailed) {
        emit(RemoteProductsFailed(error: response.error));
      }
    });
  }}
