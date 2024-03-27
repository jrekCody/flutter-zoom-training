import 'dart:async';

import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom/data/repository/auth_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({
    required this.authRepository,
  }) : super(const AuthState()) {
    on<AuthSignInStarted>(_onAuthSignInStarted);
  }

  FutureOr<void> _onAuthSignInStarted(
    AuthSignInStarted event,
    Emitter<AuthState> emit,
  ) async {
    final isSignedIn = await authRepository.signInWithGoogle();
    emit(state.copyWith(isSignedIn: isSignedIn));
  }
}
