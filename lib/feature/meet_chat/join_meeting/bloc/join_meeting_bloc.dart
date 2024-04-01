import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom/data/repository/auth_repository.dart';
import 'package:flutter_zoom/data/repository/jitsi_repository.dart';
import 'package:injectable/injectable.dart';

part 'join_meeting_event.dart';

part 'join_meeting_state.dart';

@injectable
class JoinMeetingBloc extends Bloc<JoinMeetingEvent, JoinMeetingState> {
  final AuthRepository authRepository;
  final JitsiRepository jitsiRepository;

  JoinMeetingBloc({
    required this.authRepository,
    required this.jitsiRepository,
  }) : super(const JoinMeetingState()) {
    on<JoinMeetingStarted>(_onJoinMeetingStarted);
    on<JoinMeetingRoomNameChanged>(_onJoinMeetingRoomNameChanged);
    on<JoinMeetingUserNameChanged>(_onJoinMeetingUserNameChanged);
    on<JoinMeetingTriggered>(_onJoinMeetingTriggered);
    on<AudioMuted>(_onAudioMuted);
    on<VideoOff>(_onVideoOff);
  }

  FutureOr<void> _onJoinMeetingStarted(
    JoinMeetingStarted event,
    Emitter<JoinMeetingState> emit,
  ) {
    final user = authRepository.currentUser();
    if (user != null) {
      emit(state.copyWith(userName: user.displayName));
    }
  }

  FutureOr<void> _onJoinMeetingRoomNameChanged(
    JoinMeetingRoomNameChanged event,
    Emitter<JoinMeetingState> emit,
  ) {
    emit(state.copyWith(roomName: event.roomName));
  }

  FutureOr<void> _onJoinMeetingTriggered(
    JoinMeetingTriggered event,
    Emitter<JoinMeetingState> emit,
  ) async {
    final user = authRepository.currentUser();
    if (user != null) {
      await jitsiRepository.createJoinMeeting(
        state.roomName,
        user,
        userName: state.userName,
        isMuted: state.isAudioMuted,
        isVideoOff: state.isVideoOff,
      );
    }
  }

  FutureOr<void> _onJoinMeetingUserNameChanged(
    JoinMeetingUserNameChanged event,
    Emitter<JoinMeetingState> emit,
  ) {
    emit(state.copyWith(userName: event.userName));
  }

  FutureOr<void> _onAudioMuted(
    AudioMuted event,
    Emitter<JoinMeetingState> emit,
  ) {
    emit(state.copyWith(isAudioMuted: event.muted));
  }

  FutureOr<void> _onVideoOff(
    VideoOff event,
    Emitter<JoinMeetingState> emit,
  ) {
    emit(state.copyWith(isVideoOff: event.offVideo));
  }
}
