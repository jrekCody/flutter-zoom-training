part of 'meet_bloc.dart';

final class MeetState extends Equatable {
  const MeetState();

  @override
  List<Object> get props => [];
}

final class MeetingLoading extends MeetState {
  const MeetingLoading();
}

final class MeetingStarted extends MeetState {
  const MeetingStarted();
}

final class MeetingFailed extends MeetState {
  const MeetingFailed({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
