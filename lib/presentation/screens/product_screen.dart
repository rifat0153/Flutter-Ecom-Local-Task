import 'package:cubit_test/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              itemBuilder: (BuildContext context, int index) => Card(
                color: Colors.amber,
                child: Center(
                  child: Text(data[index].product_name),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
