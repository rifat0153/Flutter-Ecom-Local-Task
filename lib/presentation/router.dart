import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/product_cubit.dart';
import '../data/models/product.dart';
import '../data/product/product_network_service.dart';
import '../data/product/product_repository.dart';
import 'screens/product/product_detail_screen.dart';
import 'screens/product/product_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                ProductCubit(repository: ProductRepository(service: ProductNetworkService())),
            child: const ProductScreen(),
          ),
        );

      case ProductDetailScreen.route:
        final args = settings.arguments as Product;

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                ProductCubit(repository: ProductRepository(service: ProductNetworkService())),
            child:  ProductDetailScreen(
              product: args,
            ),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                ProductCubit(repository: ProductRepository(service: ProductNetworkService())),
            child: const ProductScreen(),
          ),
        );
    }
  }
}
