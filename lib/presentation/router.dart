import 'package:cubit_test/data/post_network_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cubit_test/cubit/post_cubit.dart';
import 'package:cubit_test/data/post_repository.dart';
import 'package:cubit_test/presentation/screens/post_detail_screen.dart';
import 'package:cubit_test/presentation/screens/post_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                PostCubit(postRepository: PostRepository(postNetworkService: PostNetworkService())),
            child: PostScreens(),
          ),
        );

      case "/post_detail":
        return MaterialPageRoute(builder: (_) => PostDetailScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                PostCubit(postRepository: PostRepository(postNetworkService: PostNetworkService())),
            child: PostScreens(),
          ),
        );
    }
  }
}
