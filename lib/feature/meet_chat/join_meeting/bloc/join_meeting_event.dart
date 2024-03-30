part of 'join_meeting_bloc.dart';

sealed class JoinMeetingEvent extends Equatable {
  const JoinMeetingEvent();

  @override
  List<Object?> get props => [];
}

final class JoinMeetingStarted extends JoinMeetingEvent {
  const JoinMeetingStarted();
}

final class JoinMeetingRoomNameChanged extends JoinMeetingEvent {
  const JoinMeetingRoomNameChanged({required this.roomName});

  final String roomName;

  @override
  List<Object?> get props => [roomName];
}

final class JoinMeetingUserNameChanged extends JoinMeetingEvent {
  const JoinMeetingUserNameChanged({required this.userName});

  final String userName;

  @override
  List<Object?> get props => [userName];
}

final class JoinMeetingTriggered extends JoinMeetingEvent {
  const JoinMeetingTriggered();
}

final class AudioMuted extends JoinMeetingEvent {
  const AudioMuted({required this.muted});

  final bool muted;

  @override
  List<Object?> get props => [muted];
}

final class VideoOff extends JoinMeetingEvent {
  const VideoOff({required this.offVideo});

  final bool offVideo;

  @override
  List<Object?> get props => [offVideo];
}
