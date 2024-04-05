import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_zoom/data/model/mapper/meeting_mapper.dart';
import 'package:flutter_zoom/data/model/meeting_model.dart';
import 'package:flutter_zoom/data/repository/auth_repository.dart';
import 'package:flutter_zoom/data/repository/user_repository.dart';
import 'package:flutter_zoom/feature/meeting/bloc/meeting_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  final meetingModel = MeetingModel(
    roomName: 'test-room-name',
    createdAt: DateTime.now(),
  );

  group('MeetingBloc', () {
    late MeetingBloc meetingBloc;
    late MockUserRepository mockUserRepository;
    late MockAuthRepository mockAuthRepository;

    setUp(() {
      mockUserRepository = MockUserRepository();
      mockAuthRepository = MockAuthRepository();

      meetingBloc = MeetingBloc(
        userRepository: mockUserRepository,
        authRepository: mockAuthRepository,
        meetingMapper: MeetingMapper(),
      );
    });

    blocTest(
      'copyWith isFetchingMeeting new value when MeetingHistoryLoaded is triggered, user is null',
      build: () => meetingBloc,
      setUp: () {
        when(() => mockAuthRepository.currentUser()).thenReturn(null);
      },
      act: (bloc) => bloc.add(const ShowMeetingHistory()),
      expect: () => [
        const MeetingState(isFetchingMeeting: true),
        const MeetingState(isFetchingMeeting: false),
      ],
    );

    blocTest(
      'copyWith meeting, isFetchingMeeting new value when MeetingHistoryLoaded is triggered',
      build: () => meetingBloc,
      act: (bloc) =>
          bloc.add(MeetingHistoryLoaded(streamMeeting: [meetingModel])),
      expect: () => [
        MeetingState(meeting: [meetingModel], isFetchingMeeting: false),
      ],
    );
  });
}
