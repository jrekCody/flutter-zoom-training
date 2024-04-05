import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_zoom/feature/meet_chat/join_meeting/bloc/join_meeting_bloc.dart';

void main() {
  const roomName = 'test-room-name';
  const userName = 'test-name';

  test('should return the new state when copyWith is called with new values',
      () {
    const state = JoinMeetingState();

    final copy = state.copyWith(
      roomName: roomName,
      userName: userName,
      isAudioMuted: true,
    );

    expect(copy.roomName, 'test-room-name');
    expect(copy.userName, 'test-name');
    expect(copy.isAudioMuted, true);
  });

  test(
      'should return the same state when copyWith is called without new values',
      () {
    const state = JoinMeetingState();
    expect(state, state.copyWith());
  });

  test('props should returns correct properties', () {
    final props = [
      roomName,
      userName,
      true,
      false,
    ];

    expect(props, [
      'test-room-name',
      'test-name',
      true,
      false,
    ]);
  });
}
