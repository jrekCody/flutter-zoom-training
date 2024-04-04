import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_zoom/feature/meet_chat/new_meeting/bloc/new_meeting_bloc.dart';

void main() {
  test('MeetingFailed state validate is not null', () {
    const state = MeetCreateJoin(roomName: 'test-room-name');

    expect(state.props, ['test-room-name']);
    expect(state.props, isNotNull);
  });
}
