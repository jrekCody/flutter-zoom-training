import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_zoom/data/repository/auth_repository.dart';
import 'package:flutter_zoom/data/repository/jitsi_repository.dart';
import 'package:flutter_zoom/feature/meet_chat/join_meeting/bloc/join_meeting_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseUser extends Mock implements User {}

class MockAuthRepository extends Mock implements AuthRepository {}

class MockJitsiRepository extends Mock implements JitsiRepository {}

void main() {
  late MockFirebaseUser mockFirebaseUser;

  late MockAuthRepository mockAuthRepository;
  late MockJitsiRepository mockJitsiRepository;
  late JoinMeetingBloc joinMeetingBloc;

  setUp(() {
    mockFirebaseUser = MockFirebaseUser();

    mockAuthRepository = MockAuthRepository();
    mockJitsiRepository = MockJitsiRepository();
    joinMeetingBloc = JoinMeetingBloc(
      authRepository: mockAuthRepository,
      jitsiRepository: mockJitsiRepository,
    );
  });

  blocTest(
    'copyWith userName new value when JoinMeetingStarted is triggered',
    build: () => joinMeetingBloc,
    setUp: () {
      when(() => mockAuthRepository.currentUser()).thenReturn(mockFirebaseUser);
      when(() => mockFirebaseUser.displayName).thenReturn('test-name');
    },
    act: (bloc) => bloc.add(const JoinMeetingStarted()),
    expect: () => [
      const JoinMeetingState(userName: 'test-name'),
    ],
  );

  blocTest(
    'copyWith roomName new value when JoinMeetingRoomNameChanged is triggered',
    build: () => joinMeetingBloc,
    act: (bloc) =>
        bloc.add(const JoinMeetingRoomNameChanged(roomName: 'test-room-name')),
    expect: () => [
      const JoinMeetingState(roomName: 'test-room-name'),
    ],
  );

  blocTest(
    'copyWith userName new value when JoinMeetingUserNameChanged is triggered',
    build: () => joinMeetingBloc,
    act: (bloc) =>
        bloc.add(const JoinMeetingUserNameChanged(userName: 'test-name')),
    expect: () => [
      const JoinMeetingState(userName: 'test-name'),
    ],
  );

  blocTest(
    'copyWith isAudioMuted new value when AudioMuted is triggered',
    build: () => joinMeetingBloc,
    act: (bloc) => bloc.add(const AudioMuted(muted: true)),
    expect: () => [
      const JoinMeetingState(isAudioMuted: true),
    ],
  );

  blocTest(
    'copyWith isVideoOff new value when VideoOff is triggered',
    build: () => joinMeetingBloc,
    act: (bloc) => bloc.add(const VideoOff(offVideo: true)),
    expect: () => [
      const JoinMeetingState(isVideoOff: true),
    ],
  );
}
