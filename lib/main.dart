import 'package:flutter/material.dart';
import 'package:flutter_zoom/app_route_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Zoom',
      theme: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(scaffoldBackgroundColor: const Color.fromRGBO(36, 36, 36, 1)),
      routerConfig: AppRouteConfig.routeConfig,
    );
  }
}
