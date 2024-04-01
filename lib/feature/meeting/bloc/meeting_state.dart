part of 'meeting_bloc.dart';

final class MeetingState extends Equatable {
  const MeetingState({
    this.meeting = const [],
    this.isFetchingMeeting = false,
  });

  final List<MeetingModel> meeting;
  final bool isFetchingMeeting;

  @override
  List<Object> get props => [
        meeting,
        isFetchingMeeting,
      ];

  MeetingState copyWith({
    List<MeetingModel>? meeting,
    bool? isFetchingMeeting,
  }) {
    return MeetingState(
      meeting: meeting ?? this.meeting,
      isFetchingMeeting: isFetchingMeeting ?? this.isFetchingMeeting,
    );
  }
}
