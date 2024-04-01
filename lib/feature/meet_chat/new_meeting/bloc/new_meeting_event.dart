part of 'new_meeting_bloc.dart';

sealed class NewMeetingEvent extends Equatable {
  const NewMeetingEvent();

  @override
  List<Object?> get props => [];
}

final class MeetCreateJoin extends NewMeetingEvent {
  const MeetCreateJoin({required this.roomName});

  final String roomName;

  @override
  List<Object?> get props => [roomName];
}
