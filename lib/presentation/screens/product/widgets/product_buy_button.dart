import 'package:cubit_test/data/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductBuyButtonWidget extends StatelessWidget {
  const ProductBuyButtonWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 60.h,
      child: MaterialButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('${product!.product_name} added to card'),
          ));
        },
        color: Colors.blue,
        padding: EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Buy',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
              ),
            ),
            Text(
              product!.price.toString(),
              style: TextStyle(
                fontSize: 20.sp,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
