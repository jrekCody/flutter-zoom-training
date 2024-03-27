import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_zoom/data/repository/auth_repository.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth firebaseAuth;

  const AuthRepositoryImpl(this.firebaseAuth);

  @override
  Future<bool> signInWithGoogle() async {
    // Trigger the authentication flow
    final googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final auth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: auth?.accessToken,
      idToken: auth?.idToken,
    );

    // Sign in credential
    final userCredential = await firebaseAuth.signInWithCredential(credential);

    // Obtain the user object
    final user = userCredential.user;

    // return bool whether the sign in succeed
    return user != null ? true : false;
  }
}
