import 'package:firebase_auth/firebase_auth.dart';

abstract class JitsiRepository {
  Future<void> createJoinMeeting(
    String roomName,
    User user,
  );
}
