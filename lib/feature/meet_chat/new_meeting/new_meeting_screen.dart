import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom/di/di.dart';
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
      create: (context) => getIt<NewMeetingBloc>(),
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
                    icon: Icons.calendar_today,
                    label: StringUtil.schedule,
                    onPressed: () {},
                  ),
                  ZoomFeatureButtonWidget(
                    icon: Icons.arrow_upward_rounded,
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
