import 'package:flutter/material.dart';
import 'package:flutter_zoom/utils/string_util.dart';
import 'package:flutter_zoom/widgets/zoom_controller_switch_widget.dart';
import 'package:flutter_zoom/widgets/zoom_text_form_field_widget.dart';

class JoinMeetingScreen extends StatelessWidget {
  const JoinMeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringUtil.joinMeeting),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          ZoomTextFormFieldWidget(
            hint: StringUtil.roomName,
            onChanged: (value) {},
          ),
          const SizedBox(
            height: 10,
          ),
          ZoomTextFormFieldWidget(
            hint: StringUtil.name,
            onChanged: (value) {},
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            child: const Text(StringUtil.join),
            onPressed: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          ZoomControllerSwitchWidget(
            label: StringUtil.muteAudio,
            switchValue: false,
            onChanged: (value) {},
          ),
          const SizedBox(
            height: 1,
          ),
          ZoomControllerSwitchWidget(
            label: StringUtil.offVideo,
            switchValue: true,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
