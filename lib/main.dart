import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom/app_route_config.dart';
import 'package:flutter_zoom/data/model/mapper/meeting_mapper.dart';
import 'package:flutter_zoom/data/repository/impl/jitsi_repository_impl.dart';
import 'package:flutter_zoom/data/repository/impl/user_repository_impl.dart';
import 'package:flutter_zoom/utils/string_util.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';

import 'data/repository/impl/auth_repository_impl.dart';
import 'feature/auth/sign_in/bloc/auth_bloc.dart';
import 'feature/meet_chat/join_meeting/bloc/join_meeting_bloc.dart';
import 'feature/meeting/bloc/meeting_bloc.dart';
import 'firebase_options.dart';
import 'utils/color_util.dart';

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
        RepositoryProvider(
          create: (context) => JitsiRepositoryImpl(jitsiMeet: JitsiMeet()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
                authRepository:
                    RepositoryProvider.of<AuthRepositoryImpl>(context),
                userRepository:
                    RepositoryProvider.of<UserRepositoryImpl>(context)),
          ),
          BlocProvider(
            create: (context) => MeetingBloc(
                authRepository:
                    RepositoryProvider.of<AuthRepositoryImpl>(context),
                userRepository:
                    RepositoryProvider.of<UserRepositoryImpl>(context),
                meetingMapper: MeetingMapper()),
          ),
          BlocProvider(
            create: (context) => JoinMeetingBloc(
              authRepository:
                  RepositoryProvider.of<AuthRepositoryImpl>(context),
              jitsiRepository:
                  RepositoryProvider.of<JitsiRepositoryImpl>(context),
            ),
          ),
        ],
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
      ),
    );
  }
}
