import 'package:duka_la_mkononi/src/domain/models/response/product_response.dart';

import '../../../domain/repositories/api_repository.dart';
import '../../../utils/resources/data_state.dart';
import '../../base/base_api_repository.dart';
import '../data_sources/remote/fakeapi_service.dart';


class ApiRepositoryImpl extends BaseApiRepository implements ApiRepository {
  final FakeApiService _fakeApiService;

  ApiRepositoryImpl(this._fakeApiService);


  @override
  Future<DataState<ProductResponse>> getProduct() {
    // TODO: implement getProduct
    return getStateOf<ProductResponse>(
      request: () => _fakeApiService.getProducts(),
    );
  }



}