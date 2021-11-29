part of 'product_cubit.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = Initial;
  const factory ProductState.loding() = Loading;
  const factory ProductState.error(Object e) = Error;
  const factory ProductState.data(List<Product> product) = Data;
}
