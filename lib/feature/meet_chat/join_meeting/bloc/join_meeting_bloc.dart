import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'join_meeting_event.dart';
part 'join_meeting_state.dart';

class JoinMeetingBloc extends Bloc<JoinMeetingEvent, JoinMeetingState> {
  JoinMeetingBloc() : super(JoinMeetingInitial()) {
    on<JoinMeetingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
