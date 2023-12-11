import 'dart:io';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:duka_la_mkononi/src/domain/models/response/product_response.dart';

import '../../../../domain/models/product.dart';
import '../../../../utils/constants/strings.dart';

part 'fakeapi_service.g.dart';

@RestApi(baseUrl: baseUrl, parser: Parser.JsonSerializable)
abstract class FakeApiService {
  factory FakeApiService(Dio dio, {String baseUrl}) = _FakeApiService;
//abstracted method that would be responsible of getting the data from the server,
  @GET('/products')
  Future<HttpResponse<List<Product>>> getProducts();
}