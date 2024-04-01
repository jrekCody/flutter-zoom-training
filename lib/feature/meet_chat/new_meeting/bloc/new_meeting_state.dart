part of 'new_meeting_bloc.dart';

final class NewMeetingState extends Equatable {
  const NewMeetingState();

  @override
  List<Object> get props => [];
}

final class MeetingLoading extends NewMeetingState {
  const MeetingLoading();
}

final class MeetingStarted extends NewMeetingState {
  const MeetingStarted();
}

final class MeetingFailed extends NewMeetingState {
  const MeetingFailed({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
