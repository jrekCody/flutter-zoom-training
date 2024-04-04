import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_zoom/feature/auth/sign_in/bloc/auth_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockFirebaseUser extends Mock implements User {}

void main() {
  late MockFirebaseAuth mockFirebaseAuth;
  late MockFirebaseUser mockFirebaseUser;
  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockFirebaseUser = MockFirebaseUser();
  });

  test('AuthSignInStarted event is not null', () {
    const state = AuthSignInStarted();

    expect(state.props, []);
    expect(state.props, isNotNull);
  });

  test('AuthUserChanged event is not null', () {
    const state = AuthUserChanged();

    expect(state.props, []);
    expect(state.props, isNotNull);
  });

  test('AuthUpdatedUser event is not null', () {
    when(() => mockFirebaseAuth.currentUser).thenReturn(mockFirebaseUser);
    when(() => mockFirebaseUser.uid).thenReturn('test-uid');
    when(() => mockFirebaseUser.email).thenReturn('test@email.com');
    when(() => mockFirebaseUser.displayName).thenReturn('test-name');
    when(() => mockFirebaseUser.photoURL).thenReturn('test-photo');

    final state = AuthUpdatedUser(user: mockFirebaseUser);

    expect(state.props, isNotNull);
    expect(state.user.uid, 'test-uid');
    expect(state.user.email, 'test@email.com');
    expect(state.user.displayName, 'test-name');
    expect(state.user.photoURL, 'test-photo');
  });

  test('AuthSignOut event is not null', () {
    const state = AuthSignOut();

    expect(state.props, []);
    expect(state.props, isNotNull);
  });
}
