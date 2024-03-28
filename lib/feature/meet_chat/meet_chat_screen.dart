import 'package:flutter/material.dart';
import 'package:flutter_zoom/utils/string_util.dart';

import '../../widgets/zoom_feature_button_widget.dart';

class MeetChatScreen extends StatelessWidget {
  const MeetChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(StringUtil.meetChat),
          elevation: 0,
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ZoomFeatureButtonWidget(
                  icon: Icons.videocam,
                  label: StringUtil.newMeeting,
                  onPressed: () {},
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
        ));
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
