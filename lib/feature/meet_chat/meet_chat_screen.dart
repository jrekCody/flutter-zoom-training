import 'package:flutter/material.dart';

import '../../widgets/zoom_feature_button_widget.dart';

class MeetChatScreen extends StatelessWidget {
  const MeetChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Meet & Chat'),
          elevation: 0,
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ZoomFeatureButtonWidget(
                  icon: Icons.videocam,
                  label: 'New Meeting',
                  onPressed: () {},
                ),
                ZoomFeatureButtonWidget(
                  icon: Icons.add_box_rounded,
                  label: 'Join Meeting',
                  onPressed: () {},
                ),
                ZoomFeatureButtonWidget(
                  icon: Icons.add_box_rounded,
                  label: 'Schedule',
                  onPressed: () {},
                ),
                ZoomFeatureButtonWidget(
                  icon: Icons.add_box_rounded,
                  label: 'Share Screen',
                  onPressed: () {},
                ),
              ],
            ),
            const Expanded(
              child: Center(
                child: Text(
                  'Create/Join Meetings with just a click!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
