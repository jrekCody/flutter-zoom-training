import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom/app_route_config.dart';
import 'package:flutter_zoom/di/di.dart';
import 'package:flutter_zoom/feature/auth/sign_in/bloc/auth_bloc.dart';
import 'package:flutter_zoom/utils/color_util.dart';
import 'package:flutter_zoom/utils/string_util.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: StringUtil.appName,
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: ColorUtil.greyColor,
          fontFamily: StringUtil.fontFamily,
          useMaterial3: true,
        ),
        routerConfig: AppRouteConfig.routeConfig,
      ),
    );
  }
}
