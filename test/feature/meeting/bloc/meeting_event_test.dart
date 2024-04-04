import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_zoom/data/model/meeting_model.dart';
import 'package:flutter_zoom/feature/meeting/bloc/meeting_bloc.dart';

void main() {
  test('ShowMeetingHistory event is not null', () {
    const state = ShowMeetingHistory();

    expect(state.props, []);
    expect(state.props, isNotNull);
  });

  test('MeetingHistoryLoaded event is not null', () {
    final testCreatedAt = DateTime.now();
    final meetings = [
      MeetingModel(
        roomName: 'test-room-name',
        createdAt: testCreatedAt,
      )
    ];

    final state = MeetingHistoryLoaded(streamMeeting: meetings);

    expect(state.props, equals([meetings]));
    expect(state.props, isNotNull);
  });
}
