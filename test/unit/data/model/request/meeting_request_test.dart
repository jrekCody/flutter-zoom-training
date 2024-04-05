import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_zoom/data/model/request/meeting_request.dart';

void main() {
  const testUid = 'test-uid';
  const testRoom = 'test-room-name';

  // create a new instance of the MeetingRequest
  final request = MeetingRequest(
    uid: testUid,
    roomName: testRoom,
    createdAt: DateTime.now(),
  );

  group('MeetingRequest', () {
    test('copyWith should return a correct copy', () {
      // create a new copy of the request
      final copy = request.copyWith(
        uid: 'new-$testUid',
        roomName: 'new-$testRoom',
      );

      expect(copy.uid, 'new-test-uid');
      expect(copy.roomName, 'new-test-room-name');
      expect(copy.roomName, isNot(testRoom));
    });

    test('copyWith should return original value when no new value provided',
        () {
      // no new value provided
      final copy = request.copyWith();

      expect(copy.uid, testUid);
      expect(copy.roomName, testRoom);
    });

    test('props should return correct properties', () {
      // get the properties
      final props = request.props;

      expect(props, [
        testUid,
        testRoom,
        request.createdAt,
      ]);
    });
  });
}
