part of 'join_meeting_bloc.dart';

final class JoinMeetingState extends Equatable {
  const JoinMeetingState({
    this.roomName = '',
    this.userName = '',
    this.isAudioMuted = false,
    this.isVideoOff = false,
  });

  final String roomName;
  final String userName;
  final bool isAudioMuted;
  final bool isVideoOff;

  @override
  List<Object?> get props => [
        roomName,
        userName,
        isAudioMuted,
        isVideoOff,
      ];

  JoinMeetingState copyWith({
    String? roomName,
    String? userName,
    bool? isAudioMuted,
    bool? isVideoOff,
  }) {
    return JoinMeetingState(
      roomName: roomName ?? this.roomName,
      userName: userName ?? this.userName,
      isAudioMuted: isAudioMuted ?? this.isAudioMuted,
      isVideoOff: isVideoOff ?? this.isVideoOff,
    );
  }
}
