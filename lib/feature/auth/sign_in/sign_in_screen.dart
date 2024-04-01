import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom/gen/assets.gen.dart';
import 'package:flutter_zoom/utils/enum/app_route_enum.dart';
import 'package:flutter_zoom/utils/string_util.dart';
import 'package:go_router/go_router.dart';

import '../../../widgets/zoom_button_widget.dart';
import 'bloc/auth_bloc.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            context.goNamed(AppRouteEnum.newMeet.name);
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      StringUtil.startMeeting,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Image.asset(Assets.image.onboarding.path),
                    ),
                    _buildGoogleSignInButton(context),
                  ],
                ),
                if (state is AuthLoading)
                  const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildGoogleSignInButton(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(18),
        child: ZoomButtonWidget(
          label: StringUtil.googleSignIn,
          onPressed: () {
            context.read<AuthBloc>().add(const AuthSignInStarted());
          },
        ));
  }
}
