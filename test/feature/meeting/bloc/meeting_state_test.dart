import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_zoom/data/model/meeting_model.dart';
import 'package:flutter_zoom/feature/meeting/bloc/meeting_bloc.dart';

void main() {
  final testCreatedAt = DateTime.now();
  final meeting = MeetingModel(
    roomName: 'test-room-name',
    createdAt: testCreatedAt,
  );
  final meetings = [meeting];

  test('should return the new state when copyWith is called with new values',
      () {
    const state = MeetingState();
    final newState = state.copyWith(
      meeting: meetings,
      isFetchingMeeting: true,
    );
    expect(newState.meeting, meetings);
    expect(newState.isFetchingMeeting, true);
  });

  test(
      'should return the same state when copyWith is called without new values',
      () {
    const state = MeetingState();
    expect(state, state.copyWith());
  });

  test('props should returns correct properties', () {
    final props = meeting.props;

    expect(props, [
      'test-room-name',
      testCreatedAt,
    ]);
  });
}
