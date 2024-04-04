import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_zoom/data/model/request/meeting_request.dart';
import 'package:flutter_zoom/data/repository/auth_repository.dart';
import 'package:flutter_zoom/data/repository/jitsi_repository.dart';
import 'package:flutter_zoom/data/repository/user_repository.dart';
import 'package:flutter_zoom/feature/meet_chat/new_meeting/bloc/new_meeting_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseUser extends Mock implements User {}

class MockJitsiRepository extends Mock implements JitsiRepository {}

class MockAuthRepository extends Mock implements AuthRepository {}

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late MockFirebaseUser mockFirebaseUser;
  late MockJitsiRepository mockJitsiRepository;
  late MockAuthRepository mockAuthRepository;
  late MockUserRepository mockUserRepository;
  late NewMeetingBloc newMeetingBloc;

  setUp(() {
    mockFirebaseUser = MockFirebaseUser();
    mockJitsiRepository = MockJitsiRepository();
    mockAuthRepository = MockAuthRepository();
    mockUserRepository = MockUserRepository();

    newMeetingBloc = NewMeetingBloc(
      jitsiRepository: mockJitsiRepository,
      authRepository: mockAuthRepository,
      userRepository: mockUserRepository,
    );
  });

  blocTest(
    'emits [MeetingLoading, MeetingStarted] state when MeetCreateJoin is triggered',
    build: () => newMeetingBloc,
    setUp: () {
      when(() => mockAuthRepository.currentUser()).thenReturn(mockFirebaseUser);
      when(() => mockFirebaseUser.displayName).thenReturn('test-name');
      when(() => mockFirebaseUser.uid).thenReturn('test-uid');
      when(() => mockJitsiRepository.createJoinMeeting(
            'test-room-name',
            mockFirebaseUser,
            userName: 'test-name',
          )).thenAnswer((_) => Future.value());
      when(() => mockUserRepository.saveUserMeetingHistory(
            request: const MeetingRequest(
              uid: 'test-uid',
              roomName: 'test-room-name',
            ),
          )).thenAnswer((_) => Future.value());
    },
    act: (bloc) => bloc..add(const MeetCreateJoin(roomName: 'test-room-name')),
    expect: () => [isA<MeetingLoading>(), isA<MeetingStarted>()],
  );

  blocTest(
    'emits [MeetingLoading, MeetingFailed] state when MeetCreateJoin is triggered, user is null',
    build: () => newMeetingBloc,
    setUp: () {
      when(() => mockAuthRepository.currentUser()).thenReturn(null);
    },
    act: (bloc) => bloc..add(const MeetCreateJoin(roomName: 'test-room-name')),
    expect: () => [isA<MeetingLoading>(), isA<MeetingFailed>()],
  );
}
