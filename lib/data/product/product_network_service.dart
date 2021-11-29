import 'dart:convert';
import 'dart:io';
import 'package:cubit_test/data/models/product.dart';
import 'package:flutter/services.dart' show rootBundle;

class ProductNetworkService {
  Future<dynamic> parseProductJsonFromAssets(String assetsPath) async {
    print('--- Parse json from: $assetsPath');

    final jsonString = await rootBundle.loadString(assetsPath);
    final json = jsonDecode(jsonString);

    return json;
  }

  Future<List<dynamic>> fetchProducts() async {
    print('Network: fetch called');

    try {
      Future.delayed(const Duration(seconds: 2));

      final result = await parseProductJsonFromAssets('assets/products.json');

      print(result);

      return result as List;
    } on SocketException catch (e) {
      throw SocketException(e.message);
    }
  }
}
