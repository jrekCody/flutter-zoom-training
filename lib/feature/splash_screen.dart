import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom/feature/auth/sign_in/bloc/auth_bloc.dart';
import 'package:flutter_zoom/feature/auth/sign_in/sign_in_screen.dart';
import 'package:flutter_zoom/utils/enum/app_route_enum.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(const AuthUserChanged());
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            context.goNamed(AppRouteEnum.meetChat.name);
          }
        },
        builder: (context, state) => const SignInScreen(),
      ),
    );
  }
}
