part of 'meet_bloc.dart';

sealed class MeetEvent extends Equatable {
  const MeetEvent();

  @override
  List<Object?> get props => [];
}

final class MeetCreateJoin extends MeetEvent {
  const MeetCreateJoin({required this.roomName});

  final String roomName;

  @override
  List<Object?> get props => [roomName];
}
