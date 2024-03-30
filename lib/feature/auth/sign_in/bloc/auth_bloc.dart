import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom/data/repository/auth_repository.dart';
import 'package:flutter_zoom/data/repository/user_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  final UserRepository userRepository;

  AuthBloc({
    required this.authRepository,
    required this.userRepository,
  }) : super(const AuthState()) {
    on<AuthSignInStarted>(_onAuthSignInStarted);
    on<AuthUserChanged>(_onAuthUserChanged);
    on<AuthUpdatedUser>(_onAuthUpdatedUser);
    on<AuthSignOut>(_onAuthSignOut);
    on<UserUnAuthenticated>(_onUserUnAuthenticated);
  }

  late StreamSubscription _streamUserAuthChanged;

  FutureOr<void> _onAuthSignInStarted(
    AuthSignInStarted event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    final userCredential = await authRepository.signInWithGoogle();
    final user = userCredential.user;
    if (user != null) {
      if (userCredential.additionalUserInfo!.isNewUser) {
        await userRepository.saveUser(
          uid: user.uid,
          email: user.email ?? '',
          name: user.displayName ?? '',
          photo: user.photoURL ?? '',
        );
      }
      emit(Authenticated(user: user));
    } else {
      emit(const UnAuthenticated());
    }
  }

  FutureOr<void> _onAuthUserChanged(
    AuthUserChanged event,
    Emitter<AuthState> emit,
  ) {
    final streamUser = authRepository.userAuthChanges();
    _streamUserAuthChanged = streamUser.listen((event) {
      if (event != null) {
        add(AuthUpdatedUser(user: event));
      } else {
        add(const UserUnAuthenticated());
      }
    });
  }

  FutureOr<void> _onAuthUpdatedUser(
    AuthUpdatedUser event,
    Emitter<AuthState> emit,
  ) {
    emit(Authenticated(user: event.user));
  }

  FutureOr<void> _onAuthSignOut(
    AuthSignOut event,
    Emitter<AuthState> emit,
  ) async {
    await authRepository.signOut();
    emit(const UnAuthenticated());
  }

  FutureOr<void> _onUserUnAuthenticated(
    UserUnAuthenticated event,
    Emitter<AuthState> emit,
  ) {
    emit(const UnAuthenticated());
  }

  @override
  Future<void> close() {
    _streamUserAuthChanged.cancel();
    return super.close();
  }
}
