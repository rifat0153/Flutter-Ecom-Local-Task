import 'package:cubit_test/presentation/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return ScreenUtilInit(
      designSize: const Size(392, 780),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: router.generateRoute,
      ),
    );
  }
}
