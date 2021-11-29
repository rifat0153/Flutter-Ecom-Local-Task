import 'package:cubit_test/data/models/product.dart';
import 'package:cubit_test/data/product/product_network_service.dart';

class ProductRepository {
  const ProductRepository({required this.service});

  final ProductNetworkService service;

  Future<List<Product>> fetchProducts() async {
    print('repo: fetch called');
    try {
      final productRaw = await service.fetchProducts();

      final products = productRaw.map((e) => Product.fromJson(e)).toList();

      return products;
    } catch (e) {
      throw Exception(e);
    }
  }
}
