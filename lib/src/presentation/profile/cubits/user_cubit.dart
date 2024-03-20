import 'package:dio/dio.dart';
import 'package:duka_la_mkononi/src/domain/user/models/User.dart';
import 'package:duka_la_mkononi/src/domain/user/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../utils/resources/data_state.dart';
import '../../products/cubits/base/base_cubit.dart';

part 'user_state.dart';

class UserCubit extends BaseCubit<UserState, User?> {
  final UserApiRepository _userApiRepository;

  UserCubit(this._userApiRepository)
      : super(const RemoteUserLoading(),null );


  Future<void> getUser() async {
    if (isBusy) return;

    await run(() async {
      final response = await _userApiRepository.getUser();

      if (response is DataSuccess) {
        final user = response.data!;


        emit(RemoteUserSuccess(user: user));
      } else if (response is DataFailed) {
        emit(RemoteUserFailed(error: response.error));
      }
    });
  }}

