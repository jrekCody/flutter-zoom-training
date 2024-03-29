import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom/data/repository/auth_repository.dart';
import 'package:flutter_zoom/data/repository/jitsi_repository.dart';
import 'package:flutter_zoom/data/repository/user_repository.dart';

part 'meet_event.dart';

part 'meet_state.dart';

class MeetBloc extends Bloc<MeetEvent, MeetState> {
  final JitsiRepository jitsiRepository;
  final AuthRepository authRepository;
  final UserRepository userRepository;

  MeetBloc({
    required this.jitsiRepository,
    required this.authRepository,
    required this.userRepository,
  }) : super(const MeetState()) {
    on<MeetCreateJoin>(_onCreateMeeting);
  }

  FutureOr<void> _onCreateMeeting(
    MeetCreateJoin event,
    Emitter<MeetState> emit,
  ) async {
    emit(const MeetingLoading());
    try {
      final user = authRepository.currentUser();
      if (user != null) {
        await jitsiRepository.createJoinMeeting(
          event.roomName,
          user,
        );
        await userRepository.saveUserMeetingHistory(
          roomName: event.roomName,
          id: user.uid,
        );
      }
      emit(const MeetingStarted());
    } catch (e) {
      emit(MeetingFailed(message: e.toString()));
    }
  }
}
