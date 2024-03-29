import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_zoom/data/repository/jitsi_repository.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';

class JitsiRepositoryImpl implements JitsiRepository {
  final JitsiMeet jitsiMeet;

  const JitsiRepositoryImpl({required this.jitsiMeet});

  @override
  Future<void> createJoinMeeting(
    String roomName,
    User user,
  ) async {
    final options = JitsiMeetConferenceOptions(
      room: roomName,
      userInfo: JitsiMeetUserInfo(
        displayName: user.displayName,
        email: user.email,
        avatar: user.photoURL,
      ),
    );
    await jitsiMeet.join(options);
  }
}
