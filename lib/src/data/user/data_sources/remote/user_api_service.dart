import 'dart:io';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:duka_la_mkononi/src/domain/user/models/User.dart';

import '../../../../utils/constants/strings.dart';

part 'user_api_service.g.dart';

@RestApi(baseUrl: baseUrl, parser: Parser.JsonSerializable)
abstract class UserApiService {
  factory UserApiService(Dio dio, {String baseUrl}) = _UserApiService;
//abstracted method that would be responsible of getting the data from the server,
  @GET('/users/1')
  Future<HttpResponse<User>> getUser();
}