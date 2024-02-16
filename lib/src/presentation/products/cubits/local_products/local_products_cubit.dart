import 'package:bloc/bloc.dart';
import 'package:duka_la_mkononi/src/domain/models/product.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


import '../../../../domain/repositories/database_repository.dart';

part 'local_products_state.dart';

class LocalProductsCubit extends Cubit<LocalProductsState> {

  final DatabaseRepository _databaseRepository;

  LocalProductsCubit(this._databaseRepository)
      : super(const LocalProductsLoading());

  Future<void> getAllSavedProducts() async {
    emit(await _getAllSavedProducts());
  }

  Future<void> removeProduct({required Product product}) async {
    await _databaseRepository.removeProduct(product);
    emit(await _getAllSavedProducts());
  }

  Future<void> saveProduct({required Product product}) async {
    await _databaseRepository.saveProduct(product);
    emit(await _getAllSavedProducts());
  }

  Future<LocalProductsState> _getAllSavedProducts() async {
    final products = await _databaseRepository.getSavedProducts();
    return LocalProductsSuccess(products: products);
  }
 // LocalProductsCubit() : super(LocalProductsInitial());
}
