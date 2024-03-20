import 'dart:io';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../../../domain/cart/models/cart.dart';
import '../../../../utils/constants/strings.dart';

part 'cart_api_service.g.dart';

@RestApi(baseUrl: baseUrl, parser: Parser.JsonSerializable)
abstract class CartApiService {
  factory CartApiService(Dio dio, {String baseUrl}) = _CartApiService;
//abstracted method that would be responsible of getting the data from the server,
  @GET('/carts/user/3')
  Future<HttpResponse<List<Cart>>> getCarts();
}