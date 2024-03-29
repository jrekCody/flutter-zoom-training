import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom/data/repository/impl/auth_repository_impl.dart';
import 'package:flutter_zoom/data/repository/impl/jitsi_repository_impl.dart';
import 'package:flutter_zoom/data/repository/impl/user_repository_impl.dart';
import 'package:flutter_zoom/utils/extension/string_extension.dart';
import 'package:flutter_zoom/utils/string_util.dart';

import '../../widgets/zoom_feature_button_widget.dart';
import 'bloc/meet_bloc.dart';

class MeetChatScreen extends StatelessWidget {
  const MeetChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MeetBloc(
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
                  BlocBuilder<MeetBloc, MeetState>(
                    builder: (context, state) {
                      return ZoomFeatureButtonWidget(
                        icon: Icons.videocam,
                        label: StringUtil.newMeeting,
                        onPressed: () => context.read<MeetBloc>().add(
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
                    onPressed: () {},
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
