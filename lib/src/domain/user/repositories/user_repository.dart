import 'package:duka_la_mkononi/src/domain/user/models/User.dart';

import '../../../utils/resources/data_state.dart';
import '../../cart/models/cart.dart';

abstract class UserApiRepository{
  Future<DataState<User>> getUser();

}