//responsible for injecting our dependencies using the
// get_it package.

import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:duka_la_mkononi/src/data/carts/data_sources/remote/cart_api_service.dart';
import 'package:duka_la_mkononi/src/data/carts/repositories/cart_api_repository_impl.dart';
import 'package:duka_la_mkononi/src/data/products/data_sources/remote/fakeapi_service.dart';
import 'package:duka_la_mkononi/src/data/user/data_sources/remote/user_api_service.dart';
import 'package:duka_la_mkononi/src/data/user/repositories/user_api_repository_imp.dart';
import 'package:duka_la_mkononi/src/domain/cart/repositories/cart_api_repository.dart';
import 'package:duka_la_mkononi/src/domain/user/repositories/user_repository.dart';
import 'package:duka_la_mkononi/src/utils/constants/strings.dart';
import 'package:get_it/get_it.dart';

import 'data/products/data_sources/local/app_database.dart';
import 'data/products/repositories/api_repository_impl.dart';
import 'data/products/repositories/database_repository_impl.dart';
import 'domain/repositories/api_repository.dart';
import 'domain/repositories/database_repository.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  final db = await $FloorAppDatabase.databaseBuilder(databaseName).build();
  locator.registerSingleton<AppDatabase>(db);

  final dio = Dio();
  dio.interceptors.add(AwesomeDioInterceptor());

  locator.registerSingleton<Dio>(dio);

  locator.registerSingleton<FakeApiService>(
    FakeApiService(locator<Dio>()),
  );

  locator.registerSingleton<ApiRepository>(
    ApiRepositoryImpl(locator<FakeApiService>()),
  );

  locator.registerSingleton<CartApiService>(
      CartApiService(locator<Dio>()),
  );

  locator.registerSingleton<CartApiRepository>(
    CartApiRepositoryImpl(locator<CartApiService>())

  );

  locator.registerSingleton<UserApiService>(
    UserApiService(locator<Dio>()),
  );

  locator.registerSingleton<UserApiRepository>(
      UserApiRepositoryImpl(locator<UserApiService>())

  );

  locator.registerSingleton<DatabaseRepository>(
    DatabaseRepositoryImpl(locator<AppDatabase>()),
  );


}