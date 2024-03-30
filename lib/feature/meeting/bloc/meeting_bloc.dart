import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom/data/model/mapper/meeting_mapper.dart';
import 'package:flutter_zoom/data/model/meeting_model.dart';
import 'package:flutter_zoom/data/repository/auth_repository.dart';
import 'package:flutter_zoom/data/repository/user_repository.dart';

part 'meeting_event.dart';

part 'meeting_state.dart';

class MeetingBloc extends Bloc<MeetingEvent, MeetingState> {
  final UserRepository userRepository;
  final AuthRepository authRepository;
  final MeetingMapper meetingMapper;

  late StreamSubscription _streamMeetingHistory;

  MeetingBloc({
    required this.userRepository,
    required this.authRepository,
    required this.meetingMapper,
  }) : super(const MeetingState()) {
    on<ShowMeetingHistory>(_onShowMeetingHistory);
    on<MeetingHistoryLoaded>(_onMeetingHistoryLoaded);
  }

  FutureOr<void> _onShowMeetingHistory(
    ShowMeetingHistory event,
    Emitter<MeetingState> emit,
  ) async {
    emit(state.copyWith(isFetchingMeeting: true));
    final user = authRepository.currentUser();
    if (user != null) {
      final streamMeeting = userRepository.getUserMeetingHistory(
        userId: user.uid,
      );

      _streamMeetingHistory = streamMeeting.listen((event) async {
        final meetings = meetingMapper.responseToDomainList(event);
        add(MeetingHistoryLoaded(streamMeeting: meetings));
      });
    }
  }

  FutureOr<void> _onMeetingHistoryLoaded(
    MeetingHistoryLoaded event,
    Emitter<MeetingState> emit,
  ) {
    emit(state.copyWith(
      meeting: event.streamMeeting,
      isFetchingMeeting: false,
    ));
  }

  @override
  Future<void> close() {
    _streamMeetingHistory.cancel();
    return super.close();
  }
}
