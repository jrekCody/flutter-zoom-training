import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_zoom/data/repository/jitsi_repository.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';

class JitsiRepositoryImpl implements JitsiRepository {
  final JitsiMeet jitsiMeet;

  const JitsiRepositoryImpl({required this.jitsiMeet});

  @override
  Future<void> createJoinMeeting(
    String roomName,
    User user, {
    String userName = '',
    bool isMuted = true,
    bool isVideoOff = true,
  }) async {
    final options = JitsiMeetConferenceOptions(
      room: roomName,
      userInfo: JitsiMeetUserInfo(
        displayName: userName,
        email: user.email,
        avatar: user.photoURL,
      ),
      configOverrides: {
        'startWithAudioMuted': isMuted,
        'startWithVideoMuted': isVideoOff,
      },
    );
    await jitsiMeet.join(options);
  }
}
