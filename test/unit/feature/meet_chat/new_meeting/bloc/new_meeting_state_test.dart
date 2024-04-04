import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_zoom/feature/meet_chat/new_meeting/bloc/new_meeting_bloc.dart';

void main() {
  test('MeetingLoading state validate is not null', () {
    const state = MeetingLoading();

    expect(state.props, []);
    expect(state.props, isNotNull);
  });

  test('MeetingStarted state validate is not null', () {
    const state = MeetingStarted();

    expect(state.props, []);
    expect(state.props, isNotNull);
  });
  
  test('MeetingFailed state validate is not null', () {
    const state = MeetingFailed(message: 'test-message');

    expect(state.props, ['test-message']);
    expect(state.props, isNotNull);
  });
}
