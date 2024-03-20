part of 'user_cubit.dart';

// abstract class UserState {}

@immutable
abstract class UserState extends Equatable {
  final User? user;
  final DioException? error;

  const UserState({
    this.user,
    this.error,
  });

  @override
  List<Object?> get props => [user, error];
}
class RemoteUserLoading extends UserState {
  const RemoteUserLoading();

}
// indicate that the cubit has finished with a success results
// (list of products and no more data flag indicator).

class RemoteUserSuccess extends UserState {
  const RemoteUserSuccess({super.user});


}

// indicate that the cubit has failed to
// complete the process, with details on how it failed (DioError instance) .

class RemoteUserFailed extends UserState {
  const RemoteUserFailed({super.error});


}


