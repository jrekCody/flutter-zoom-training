part of 'join_meeting_bloc.dart';

sealed class JoinMeetingState extends Equatable {
  const JoinMeetingState();
}

final class JoinMeetingInitial extends JoinMeetingState {
  @override
  List<Object> get props => [];
}
