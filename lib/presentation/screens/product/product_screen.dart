import 'package:cubit_test/cubit/product_cubit.dart';
import 'package:cubit_test/data/models/product.dart';
import 'package:cubit_test/presentation/screens/product/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProductCubit>(context).fetchProducts();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Screen'),
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(
              child: Text('Product Loading'),
            ),
            loding: () => const Center(
              child: Text('Product Loading'),
            ),
            error: (e) => Center(
              child: Text(e.toString()),
            ),
            data: (data) => GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () {
                  print('Passing: ' + data[index].toString());
                  Navigator.pushNamed(
                    context,
                    ProductDetailScreen.route,
                    arguments: data[index],
                  );
                },
                child: Card(
                    color: Colors.amber,
                    child: Stack(
                      children: [
                        Image.network(
                          data[index].photo_src_link,
                          fit: BoxFit.cover,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(color: Colors.black.withOpacity(0.1)),
                            child: Text(
                              data[index].product_name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20.sp,
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              ),
            ),
          );
        },
      ),
    );
  }
}
