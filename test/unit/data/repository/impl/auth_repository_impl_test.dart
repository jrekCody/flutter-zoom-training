import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_zoom/data/repository/impl/auth_repository_impl.dart';
import 'package:google_sign_in_mocks/google_sign_in_mocks.dart';
import 'package:mocktail/mocktail.dart';

class MockAuth extends Mock implements FirebaseAuth {}

class MockFirebaseUser extends Mock implements User {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // use for mocking google sign in and firebase auth mocks
  late MockGoogleSignIn mockGoogleSignIn;
  late MockFirebaseAuth mockFirebaseAuth;

  // use for mocking firebase auth and firebase user
  late MockAuth mockAuth;
  late MockFirebaseUser mockFirebaseUser;

  late AuthRepositoryImpl authRepositoryImpl;

  setUp(() {
    mockGoogleSignIn = MockGoogleSignIn();
    mockFirebaseAuth = MockFirebaseAuth();

    mockAuth = MockAuth();
    mockFirebaseUser = MockFirebaseUser();

    authRepositoryImpl = AuthRepositoryImpl(
      mockFirebaseAuth,
      mockGoogleSignIn,
    );
  });

  test('signInWithGoogle should returns UserCredential on successful sign in',
      () async {
    final result = await authRepositoryImpl.signInWithGoogle();
    expect(result, isA<UserCredential>());
  });

  test('userAuthChanges should return a Stream<User?>', () {
    final result = authRepositoryImpl.userAuthChanges();
    expect(result, isA<Stream<User?>>());
  });

  test('currentUser should return a User', () {
    when(() => mockAuth.currentUser).thenReturn(mockFirebaseUser);
    expect(authRepositoryImpl.currentUser(), isA<User?>());
  });

  test('signOut should return success', () async {
    when(() => mockAuth.signOut()).thenAnswer((_) => Future.value());
    expect(authRepositoryImpl.signOut(), isA<void>());
  });
}
