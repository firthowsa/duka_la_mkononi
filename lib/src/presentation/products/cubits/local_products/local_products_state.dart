part of 'local_products_cubit.dart';

@immutable
abstract class LocalProductsState extends Equatable {

  final List<Product> products;

  const LocalProductsState({
    this.products = const [],
  });

  @override
  List<Object> get props => [products];
}

class LocalProductsLoading extends LocalProductsState {
  const LocalProductsLoading();
}

class LocalProductsSuccess extends LocalProductsState {
  const LocalProductsSuccess({super.products});
}



