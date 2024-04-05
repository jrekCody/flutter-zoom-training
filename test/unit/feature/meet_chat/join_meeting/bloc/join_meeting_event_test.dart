import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_zoom/feature/meet_chat/join_meeting/bloc/join_meeting_bloc.dart';

void main() {
  test('JoinMeetingStarted event is not null', () {
    const state = JoinMeetingStarted();

    expect(state.props, []);
    expect(state.props, isNotNull);
  });

  test('JoinMeetingRoomNameChanged event is not null', () {
    const state = JoinMeetingRoomNameChanged(roomName: 'test-room-name');

    expect(state.props, ['test-room-name']);
    expect(state.props, isNotNull);
  });

  test('JoinMeetingUserNameChanged event is not null', () {
    const state = JoinMeetingUserNameChanged(userName: 'test-name');

    expect(state.props, ['test-name']);
    expect(state.props, isNotNull);
  });

  test('JoinMeetingTriggered event is not null', () {
    const state = JoinMeetingTriggered();

    expect(state.props, []);
    expect(state.props, isNotNull);
  });

  test('AudioMuted event is not null', () {
    const state = AudioMuted(muted: false);

    expect(state.props, [false]);
    expect(state.props, isNotNull);
  });

  test('VideoOff event is not null', () {
    const state = VideoOff(offVideo: true);

    expect(state.props, [true]);
    expect(state.props, isNotNull);
  });
}
