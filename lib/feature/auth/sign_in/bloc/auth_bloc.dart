import 'dart:async';

import 'package:equatable/equatable.dart';

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
  }

  FutureOr<void> _onAuthSignInStarted(
    AuthSignInStarted event,
    Emitter<AuthState> emit,
  ) async {
    final userCredential = await authRepository.signInWithGoogle();
    final user = userCredential.user;
    if (user != null) {
      if (userCredential.additionalUserInfo!.isNewUser) {
        await userRepository.saveUser(
          user.uid,
          user.displayName ?? 'no-name',
          user.photoURL ?? '',
        );
      }
    }
  }
}
