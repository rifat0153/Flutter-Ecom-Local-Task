import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    String? id,
    required String product_name,
    required String photo_src_link,
    required int price,
    required String description,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}

@freezed
class ProductListUnion with _$ProductListUnion {
  const factory ProductListUnion.data(List<Product> productList) = Data;
  const factory ProductListUnion.empty() = Empty;
  const factory ProductListUnion.error(Object err) = Error;
  const factory ProductListUnion.loading() = Loading;
}
