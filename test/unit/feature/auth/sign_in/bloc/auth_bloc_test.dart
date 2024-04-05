import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_zoom/data/model/request/user_request.dart';
import 'package:flutter_zoom/data/repository/auth_repository.dart';
import 'package:flutter_zoom/data/repository/user_repository.dart';
import 'package:flutter_zoom/feature/auth/sign_in/bloc/auth_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockFirebaseUser extends Mock implements User {}

class MockUserCredential extends Mock implements UserCredential {}

class MockAdditionalUserInfo extends Mock implements AdditionalUserInfo {}

class MockAuthRepository extends Mock implements AuthRepository {}

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late MockFirebaseAuth mockFirebaseAuth;
  late MockFirebaseUser mockFirebaseUser;
  late MockUserCredential mockUserCredential;
  late MockAdditionalUserInfo mockAdditionalUserInfo;

  late MockAuthRepository mockAuthRepository;
  late MockUserRepository mockUserRepository;
  late AuthBloc authBloc;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockFirebaseUser = MockFirebaseUser();
    mockUserCredential = MockUserCredential();
    mockAdditionalUserInfo = MockAdditionalUserInfo();

    mockAuthRepository = MockAuthRepository();
    mockUserRepository = MockUserRepository();
    authBloc = AuthBloc(
      authRepository: mockAuthRepository,
      userRepository: mockUserRepository,
    );

    // Set up a default return value for additionalUserInfo
    when(() => mockUserCredential.additionalUserInfo)
        .thenReturn(mockAdditionalUserInfo);
  });

  blocTest(
    'emits [AuthLoading, Authenticated] when AuthSignInStarted is triggered',
    build: () => authBloc,
    setUp: () {
      when(() => mockAuthRepository.signInWithGoogle())
          .thenAnswer((_) => Future.value(mockUserCredential));
      when(() => mockUserCredential.user).thenReturn(mockFirebaseUser);
      when(() => mockAdditionalUserInfo.isNewUser).thenReturn(true);
      when(() => mockFirebaseUser.uid).thenReturn('test-uid');
      when(() => mockFirebaseUser.email).thenReturn('test@email.com');
      when(() => mockFirebaseUser.displayName).thenReturn('test-name');
      when(() => mockFirebaseUser.photoURL).thenReturn('test-photo');
      when(() => mockUserRepository.saveUser(
            request: const UserRequest(
              id: 'test-uid',
              email: 'test@email.com',
              name: 'test-name',
              photo: 'test-photo',
            ),
          )).thenAnswer((_) => Future.value());
    },
    act: (bloc) => bloc..add(const AuthSignInStarted()),
    expect: () => [isA<AuthLoading>(), isA<Authenticated>()],
  );

  blocTest(
    'emits [AuthLoading, UnAuthenticated] when AuthSignInStarted is triggered, user is null',
    build: () => authBloc,
    setUp: () {
      when(() => mockAuthRepository.signInWithGoogle())
          .thenAnswer((_) => Future.value(mockUserCredential));
      when(() => mockUserCredential.user).thenReturn(null);
    },
    act: (bloc) => bloc..add(const AuthSignInStarted()),
    expect: () => [isA<AuthLoading>(), isA<UnAuthenticated>()],
  );

  blocTest(
    'emits [Authenticated] when AuthUserChanged is triggered',
    build: () => authBloc,
    setUp: () {
      when(() => mockAuthRepository.currentUser()).thenReturn(mockFirebaseUser);
    },
    act: (bloc) => bloc..add(const AuthUserChanged()),
    expect: () => [isA<Authenticated>()],
  );

  blocTest(
    'emits [UnAuthenticated] when AuthUserChanged is triggered, user is null',
    build: () => authBloc,
    setUp: () {
      when(() => mockAuthRepository.currentUser()).thenReturn(null);
    },
    act: (bloc) => bloc..add(const AuthUserChanged()),
    expect: () => [isA<UnAuthenticated>()],
  );

  blocTest(
    'emits [Authenticated] when AuthUpdatedUser is triggered',
    build: () => authBloc,
    setUp: () {
      when(() => mockFirebaseAuth.currentUser).thenReturn(mockFirebaseUser);
    },
    act: (bloc) => bloc..add(AuthUpdatedUser(user: mockFirebaseUser)),
    expect: () => [isA<Authenticated>()],
  );

  blocTest(
    'emits [UnAuthenticated] when AuthSignOut is triggered',
    build: () => authBloc,
    setUp: () {
      when(() => mockAuthRepository.signOut())
          .thenAnswer((_) => Future.value());
    },
    act: (bloc) => bloc..add(const AuthSignOut()),
    expect: () => [isA<UnAuthenticated>()],
  );
}
