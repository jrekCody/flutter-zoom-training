part of 'meeting_bloc.dart';

sealed class MeetingEvent extends Equatable {
  const MeetingEvent();

  @override
  List<Object?> get props => [];
}

final class ShowMeetingHistory extends MeetingEvent {
  const ShowMeetingHistory();
}

final class MeetingHistoryLoaded extends MeetingEvent {
  const MeetingHistoryLoaded({required this.streamMeeting});

  final List<MeetingModel> streamMeeting;

  @override
  List<Object?> get props => [streamMeeting];
}
