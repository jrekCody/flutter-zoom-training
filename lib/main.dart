import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom/app_route_config.dart';

import 'data/repository/impl/auth_repository_impl.dart';
import 'feature/auth/sign_in/bloc/auth_bloc.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepositoryImpl(FirebaseAuth.instance),
      child: BlocProvider(
        create: (context) => AuthBloc(
            authRepository: RepositoryProvider.of<AuthRepositoryImpl>(context)),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Zoom',
          theme: ThemeData.dark(
            useMaterial3: true,
          ).copyWith(
              scaffoldBackgroundColor: const Color.fromRGBO(36, 36, 36, 1)),
          routerConfig: AppRouteConfig.routeConfig,
        ),
      ),
    );
  }
}
