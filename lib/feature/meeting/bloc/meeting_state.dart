part of 'meeting_bloc.dart';

final class MeetingState extends Equatable {
  const MeetingState({this.meeting = const []});

  final List<MeetingModel> meeting;

  @override
  List<Object> get props => [meeting];

  MeetingState copyWith({
    List<MeetingModel>? meeting,
  }) {
    return MeetingState(
      meeting: meeting ?? this.meeting,
    );
  }
}
