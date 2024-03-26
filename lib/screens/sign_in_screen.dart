import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/enum/app_route_enum.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: const Text('sign in'),
          onPressed: () => context.goNamed(AppRouteEnum.dashboard.name),
        ),
      ),
    );
  }
}
