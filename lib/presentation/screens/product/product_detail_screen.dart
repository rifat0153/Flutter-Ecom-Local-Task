
import 'package:flutter/material.dart';

import '../../../data/models/product.dart';
import 'widgets/product_buy_button.dart';
import 'widgets/product_details_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  static const route = 'product_detail_screen';
  const ProductDetailScreen({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product? product;

  @override
  Widget build(BuildContext context) {
    return product == null
        ? const Center(
            child: Text('No Product Data Found'),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(product!.product_name),
            ),
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductDetailsWidget(product: product),
                  ProductBuyButtonWidget(product: product)
                ],
              ),
            ),
          );
  }
}




