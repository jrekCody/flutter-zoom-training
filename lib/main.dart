import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom/app_route_config.dart';
import 'package:flutter_zoom/data/repository/impl/user_repository_impl.dart';

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
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepositoryImpl(FirebaseAuth.instance),
        ),
        RepositoryProvider(
          create: (context) => UserRepositoryImpl(FirebaseFirestore.instance),
        ),
      ],
      child: BlocProvider(
        create: (context) => AuthBloc(
            authRepository: RepositoryProvider.of<AuthRepositoryImpl>(context),
            userRepository: RepositoryProvider.of<UserRepositoryImpl>(context)),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Zoom',
          theme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: 'Lato',
            useMaterial3: true,
          ),
          routerConfig: AppRouteConfig.routeConfig,
        ),
      ),
    );
  }
}
