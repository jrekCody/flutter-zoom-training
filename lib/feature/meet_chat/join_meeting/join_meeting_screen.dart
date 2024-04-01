import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom/di/di.dart';
import 'package:flutter_zoom/utils/string_util.dart';
import 'package:flutter_zoom/widgets/zoom_controller_switch_widget.dart';
import 'package:flutter_zoom/widgets/zoom_text_form_field_widget.dart';

import 'bloc/join_meeting_bloc.dart';

class JoinMeetingScreen extends StatelessWidget {
  const JoinMeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<JoinMeetingBloc>()
        ..add(
          const JoinMeetingStarted(),
        ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(StringUtil.joinMeeting),
        ),
        body: Column(
          children: [
            _buildRoomNameWidget(),
            _buildUserNameWidget(),
            _buildJoinButtonWidget(),
            _buildMuteAudioWidget(),
            const SizedBox(height: 1),
            _buildVideoTurnOffWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildRoomNameWidget() {
    return BlocSelector<JoinMeetingBloc, JoinMeetingState, String>(
      selector: (state) => state.roomName,
      builder: (context, roomName) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ZoomTextFormFieldWidget(
            hint: roomName.isNotEmpty ? roomName : StringUtil.roomName,
            onChanged: (value) => context
                .read<JoinMeetingBloc>()
                .add(JoinMeetingRoomNameChanged(roomName: value)),
          ),
        );
      },
    );
  }

  Widget _buildUserNameWidget() =>
      BlocSelector<JoinMeetingBloc, JoinMeetingState, String>(
        selector: (state) => state.userName,
        builder: (context, userName) {
          return ZoomTextFormFieldWidget(
            hint: userName,
            onChanged: (value) => context
                .read<JoinMeetingBloc>()
                .add(JoinMeetingUserNameChanged(userName: value)),
          );
        },
      );

  Widget _buildJoinButtonWidget() =>
      BlocBuilder<JoinMeetingBloc, JoinMeetingState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: TextButton(
              child: const Text(StringUtil.join),
              onPressed: () {
                context
                    .read<JoinMeetingBloc>()
                    .add(const JoinMeetingTriggered());
              },
            ),
          );
        },
      );

  Widget _buildMuteAudioWidget() =>
      BlocSelector<JoinMeetingBloc, JoinMeetingState, bool>(
        selector: (state) => state.isAudioMuted,
        builder: (context, isMuted) {
          return ZoomControllerSwitchWidget(
            label: StringUtil.muteAudio,
            switchValue: isMuted,
            onChanged: (value) => context.read<JoinMeetingBloc>().add(
                  AudioMuted(muted: value),
                ),
          );
        },
      );

  Widget _buildVideoTurnOffWidget() =>
      BlocSelector<JoinMeetingBloc, JoinMeetingState, bool>(
        selector: (state) => state.isVideoOff,
        builder: (context, isOff) {
          return ZoomControllerSwitchWidget(
            label: StringUtil.muteAudio,
            switchValue: isOff,
            onChanged: (value) => context.read<JoinMeetingBloc>().add(
                  VideoOff(offVideo: value),
                ),
          );
        },
      );
}
