part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

final class AuthSignInStarted extends AuthEvent {
  const AuthSignInStarted();
}

final class AuthUserChanged extends AuthEvent {
  const AuthUserChanged();
}

final class AuthUpdatedUser extends AuthEvent {
  const AuthUpdatedUser({required this.user});

  final User user;

  @override
  List<Object?> get props => [user];
}

final class AuthSignOut extends AuthEvent {
  const AuthSignOut();
}
