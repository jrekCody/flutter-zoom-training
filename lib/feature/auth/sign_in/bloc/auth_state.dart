part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState({
    this.isSignedIn = false,
  });

  final bool isSignedIn;

  @override
  List<Object?> get props => [isSignedIn];

  AuthState copyWith({bool? isSignedIn}) {
    return AuthState(isSignedIn: isSignedIn ?? this.isSignedIn);
  }
}
