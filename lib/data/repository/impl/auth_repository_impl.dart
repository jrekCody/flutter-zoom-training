import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_zoom/data/repository/auth_repository.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth firebaseAuth;

  const AuthRepositoryImpl(this.firebaseAuth);

  @override
  Future<UserCredential> signInWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();

    final auth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: auth?.accessToken,
      idToken: auth?.idToken,
    );

    return await firebaseAuth.signInWithCredential(credential);
  }

  @override
  Stream<User?> userAuthChanges() => firebaseAuth.authStateChanges();

  @override
  User? currentUser() => firebaseAuth.currentUser;

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
