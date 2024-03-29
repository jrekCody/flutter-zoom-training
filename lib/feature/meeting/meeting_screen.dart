import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom/feature/meeting/bloc/meeting_bloc.dart';
import 'package:flutter_zoom/utils/datetime_util.dart';
import 'package:flutter_zoom/utils/string_util.dart';

class MeetingScreen extends StatelessWidget {
  const MeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<MeetingBloc>().add(const ShowMeetingHistory());
    return Scaffold(
        appBar: AppBar(
          title: const Text(StringUtil.meeting),
        ),
        body: BlocBuilder<MeetingBloc, MeetingState>(
          builder: (context, state) {
            if (state.meeting.isNotEmpty) {
              return ListView.separated(
                itemCount: state.meeting.length,
                itemBuilder: (context, index) {
                  final rooms = state.meeting[index];
                  return ListTile(
                    title: Text('Room Name: ${rooms.roomName}'),
                    subtitle: Text(
                        'Joined on ${DateTimeUtil.formattedDateYMMMd(rooms.createdAt)}'),
                  );
                },
                separatorBuilder: (_, __) => const Divider(
                  height: 0.5,
                  indent: 15,
                  endIndent: 15,
                ),
              );
            } else {
              return const Center(
                child: Text('no room meetings'),
              );
            }
          },
        ));
  }
}
