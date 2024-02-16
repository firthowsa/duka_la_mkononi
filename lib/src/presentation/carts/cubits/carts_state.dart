part of 'carts_cubit.dart';

@immutable
abstract class CartsState extends Equatable {
  final List<Cart> carts;
  final bool noMoreData;
  final DioException? error;

  const CartsState({
    this.carts = const [],
    this.noMoreData = true,
    this.error,
  });

  @override
  List<Object?> get props => [carts, noMoreData, error];
}

class RemoteCartsLoading extends CartsState {
  const RemoteCartsLoading();

}
// indicate that the cubit has finished with a success results
// (list of products and no more data flag indicator).

class RemoteCartsSuccess extends CartsState {
  const RemoteCartsSuccess({super.carts, super.noMoreData});


}

// indicate that the cubit has failed to
// complete the process, with details on how it failed (DioError instance) .

class RemoteCartsFailed extends CartsState {
  const RemoteCartsFailed({super.error});


}


