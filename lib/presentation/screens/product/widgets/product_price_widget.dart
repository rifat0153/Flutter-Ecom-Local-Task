import 'package:cubit_test/data/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductPriceWidget extends StatelessWidget {
  const ProductPriceWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Price',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          product!.price.toString(),
          style: TextStyle(
            fontSize: 26.sp,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}