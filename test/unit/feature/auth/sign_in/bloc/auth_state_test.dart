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

  test('Authenticated state validate is not null', () {
    when(() => mockFirebaseAuth.currentUser).thenReturn(mockFirebaseUser);
    when(() => mockFirebaseUser.uid).thenReturn('test-uid');
    when(() => mockFirebaseUser.email).thenReturn('test@email.com');
    when(() => mockFirebaseUser.displayName).thenReturn('test-name');
    when(() => mockFirebaseUser.photoURL).thenReturn('test-photo');

    final state = Authenticated(user: mockFirebaseUser);

    expect(state.props, isNotNull);
    expect(state.user.uid, 'test-uid');
    expect(state.user.email, 'test@email.com');
    expect(state.user.displayName, 'test-name');
    expect(state.user.photoURL, 'test-photo');
  });

  test('UnAuthenticated state validate is not null', () {
    const state = UnAuthenticated();

    expect(state.props, []);
    expect(state.props, isNotNull);
  });

  test('AuthLoading state validate is not null', () {
    const state = AuthLoading();

    expect(state.props, []);
    expect(state.props, isNotNull);
  });
}
