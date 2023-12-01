//responsible for injecting our dependencies using the
// get_it package.

import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:duka_la_mkononi/src/data/products/data_sources/remote/fakeapi_service.dart';
import 'package:get_it/get_it.dart';

import 'data/products/repositories/api_repository_impl.dart';
import 'domain/repositories/api_repository.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {


  final dio = Dio();
  dio.interceptors.add(AwesomeDioInterceptor());

  locator.registerSingleton<Dio>(dio);

  locator.registerSingleton<FakeApiService>(
    FakeApiService(locator<Dio>()),
  );

  locator.registerSingleton<ApiRepository>(
    ApiRepositoryImpl(locator<FakeApiService>()),
  );


}