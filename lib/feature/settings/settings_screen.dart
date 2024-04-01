import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom/feature/auth/sign_in/bloc/auth_bloc.dart';
import 'package:flutter_zoom/utils/enum/app_route_enum.dart';
import 'package:flutter_zoom/utils/string_util.dart';
import 'package:flutter_zoom/widgets/zoom_button_widget.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          context.goNamed(AppRouteEnum.signIn.name);
        }
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text(StringUtil.settings),
          ),
          body: Padding(
            padding: const EdgeInsets.all(18),
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return ZoomButtonWidget(
                  label: StringUtil.signOut,
                  onPressed: () {
                    context.read<AuthBloc>().add(const AuthSignOut());
                  },
                );
              },
            ),
          )),
    );
  }
}
