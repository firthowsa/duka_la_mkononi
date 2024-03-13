import 'package:duka_la_mkononi/src/data/user/data_sources/remote/user_api_service.dart';
import 'package:duka_la_mkononi/src/domain/user/models/User.dart';
import 'package:duka_la_mkononi/src/domain/user/repositories/user_repository.dart';

import '../../../domain/cart/models/cart.dart';
import '../../../utils/resources/data_state.dart';
import '../../base/base_api_repository.dart';

class UserApiRepositoryImpl extends BaseApiRepository implements UserApiRepository {
  final UserApiService _userApiService;

  UserApiRepositoryImpl(this._userApiService);


  @override
  Future<DataState<User>> getUser() {

    return getStateOf<User>(
      request: () => _userApiService.getUser(),
    );
  }

}