import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/models/product.dart';
import 'product_price_widget.dart';

class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.maxFinite,
              height: 0.5.sh,
              child: Image.network(
                product!.photo_src_link,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductPriceWidget(product: product),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Description',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 24.sp,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    product!.description,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}