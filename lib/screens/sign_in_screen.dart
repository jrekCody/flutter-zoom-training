import 'package:flutter/material.dart';
import 'package:flutter_zoom/gen/assets.gen.dart';
import 'package:flutter_zoom/utils/string_util.dart';
import 'package:go_router/go_router.dart';

import '../utils/enum/app_route_enum.dart';
import '../widgets/zoom_button_widget.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          Padding(
            padding: const EdgeInsets.all(18),
            child: ZoomButtonWidget(
              label: StringUtil.googleSignIn,
              onPressed: () => context.goNamed(
                AppRouteEnum.dashboard.name,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
