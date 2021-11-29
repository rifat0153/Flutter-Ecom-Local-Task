import 'package:bloc/bloc.dart';
import 'package:cubit_test/data/models/product.dart';
import 'package:cubit_test/data/product/product_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_state.dart';
part 'product_cubit.freezed.dart'; // Dont forget to write this line as the generate code will be part for this file

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({required this.repository}) : super(const ProductState.initial());

  ProductRepository repository;

  Future<void> fetchProducts() async {
    Future.delayed(const Duration(seconds: 2));
    emit(const ProductState.loding());
    final productState = await repository.fetchProducts();
    emit(ProductState.data(productState));
  }
}
