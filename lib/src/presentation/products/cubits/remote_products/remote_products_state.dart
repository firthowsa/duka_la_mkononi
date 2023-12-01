part of 'remote_products_cubit.dart';

@immutable
abstract class RemoteProductsState extends Equatable {
  final List<Product> products;
  final bool noMoreData;
  final DioException? error;

  const RemoteProductsState({
    this.products = const [],
    this.noMoreData = true,
    this.error,
  });

  @override
  List<Object?> get props => [products, noMoreData, error];
}
// used to indicate that the cubit is running
// a process (fetching api data) inside and needs to wait till it completes.
class RemoteProductsLoading extends RemoteProductsState {
  const RemoteProductsLoading();

}
// indicate that the cubit has finished with a success results
// (list of products and no more data flag indicator).

class RemoteProductsSuccess extends RemoteProductsState {
  const RemoteProductsSuccess({super.products, super.noMoreData});


}

// indicate that the cubit has failed to
// complete the process, with details on how it failed (DioError instance) .

class RemoteProductsFailed extends RemoteProductsState {
  const RemoteProductsFailed({super.error});


}
