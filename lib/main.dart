import 'package:cubit_test/presentation/router.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(PostApp(
    router: AppRouter(),
  ));
}

class PostApp extends StatelessWidget {
  const PostApp({
    Key? key,
    required this.router,
  }) : super(key: key);

  final AppRouter router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: router.generateRoute,
    );
  }
}
