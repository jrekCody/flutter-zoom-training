import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_zoom/utils/string_util.dart';

void main() {
  group('StringUtil', () {
    test('appName returns correct value', () {
      expect(StringUtil.appName, 'Flutter Zoom');
    });

    test('fontFamily returns correct value', () {
      expect(StringUtil.fontFamily, 'Lato');
    });

    test('startMeeting returns correct value', () {
      expect(StringUtil.startMeeting, 'Start or join a meeting');
    });

    test('googleSignIn returns correct value', () {
      expect(StringUtil.googleSignIn, 'Google Sign In');
    });

    test('meetChat returns correct value', () {
      expect(StringUtil.meetChat, 'Meet & Chat');
    });

    test('meeting returns correct value', () {
      expect(StringUtil.meeting, 'Meetings');
    });

    test('contacts returns correct value', () {
      expect(StringUtil.contacts, 'Contacts');
    });

    test('settings returns correct value', () {
      expect(StringUtil.settings, 'Settings');
    });

    test('newMeeting returns correct value', () {
      expect(StringUtil.newMeeting, 'New Meeting');
    });

    test('joinMeeting returns correct value', () {
      expect(StringUtil.joinMeeting, 'Join Meeting');
    });

    test('schedule returns correct value', () {
      expect(StringUtil.schedule, 'Schedule');
    });

    test('shareScreen returns correct value', () {
      expect(StringUtil.shareScreen, 'Share Screen');
    });

    test('createJoinMeeting returns correct value', () {
      expect(StringUtil.createJoinMeeting,
          'Create/Join Meetings with just a click!');
    });

    test('roomName returns correct value', () {
      expect(StringUtil.roomName, 'Room Name');
    });

    test('name returns correct value', () {
      expect(StringUtil.name, 'Name');
    });

    test('join returns correct value', () {
      expect(StringUtil.join, 'Join');
    });

    test('joinedOn returns correct value', () {
      expect(StringUtil.joinedOn, 'Joined on');
    });

    test('muteAudio returns correct value', () {
      expect(StringUtil.muteAudio, 'Mute Audio');
    });

    test('offVideo returns correct value', () {
      expect(StringUtil.offVideo, 'Turn off video');
    });

    test('signOut returns correct value', () {
      expect(StringUtil.signOut, 'Sign Out');
    });

    test('noMeetingHistory returns correct value', () {
      expect(StringUtil.noMeetingHistory, 'No meeting history');
    });

    test('jitsiConfigStartWithAudioMuted returns correct value', () {
      expect(StringUtil.jitsiConfigStartWithAudioMuted, 'startWithAudioMuted');
    });

    test('jitsiConfigStartWithVideoMuted returns correct value', () {
      expect(StringUtil.jitsiConfigStartWithVideoMuted, 'startWithVideoMuted');
    });
  });
}
