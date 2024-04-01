import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom/data/repository/impl/auth_repository_impl.dart';
import 'package:flutter_zoom/data/repository/impl/jitsi_repository_impl.dart';
import 'package:flutter_zoom/data/repository/impl/user_repository_impl.dart';
import 'package:flutter_zoom/utils/enum/app_route_enum.dart';
import 'package:flutter_zoom/utils/extension/string_extension.dart';
import 'package:flutter_zoom/utils/string_util.dart';
import 'package:go_router/go_router.dart';

import '../../../widgets/zoom_feature_button_widget.dart';
import '../new_meeting/bloc/new_meeting_bloc.dart';

class NewMeetingScreen extends StatelessWidget {
  const NewMeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewMeetingBloc(
          jitsiRepository: RepositoryProvider.of<JitsiRepositoryImpl>(context),
          authRepository: RepositoryProvider.of<AuthRepositoryImpl>(context),
          userRepository: RepositoryProvider.of<UserRepositoryImpl>(context)),
      child: Scaffold(
          appBar: AppBar(
            title: const Text(StringUtil.meetChat),
            elevation: 0,
          ),
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BlocBuilder<NewMeetingBloc, NewMeetingState>(
                    builder: (context, state) {
                      return ZoomFeatureButtonWidget(
                        icon: Icons.videocam,
                        label: StringUtil.newMeeting,
                        onPressed: () => context.read<NewMeetingBloc>().add(
                              MeetCreateJoin(
                                roomName: StringExtensions.getRandomString(5),
                              ),
                            ),
                      );
                    },
                  ),
                  ZoomFeatureButtonWidget(
                    icon: Icons.add_box_rounded,
                    label: StringUtil.joinMeeting,
                    onPressed: () {
                      context.pushNamed(AppRouteEnum.joinMeet.name);
                    },
                  ),
                  ZoomFeatureButtonWidget(
                    icon: Icons.add_box_rounded,
                    label: StringUtil.schedule,
                    onPressed: () {},
                  ),
                  ZoomFeatureButtonWidget(
                    icon: Icons.add_box_rounded,
                    label: StringUtil.shareScreen,
                    onPressed: () {},
                  ),
                ],
              ),
              Expanded(
                child: _buildCreateJoinMeetingLabel(),
              ),
            ],
          )),
    );
  }

  Widget _buildCreateJoinMeetingLabel() => const Center(
        child: Text(
          StringUtil.createJoinMeeting,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      );
}
