part of 'auth_bloc.dart';

final class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

final class AuthLoading extends AuthState {
  const AuthLoading();
}

final class Authenticated extends AuthState {
  const Authenticated({required this.user});

  final User user;

  @override
  List<Object?> get props => [user];
}

final class UnAuthenticated extends AuthState {
  const UnAuthenticated();
}
