import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_zoom/data/model/meeting_model.dart';

void main() {
  const testRoom = 'test-room-name';
  final testCreatedAt = DateTime.now();

  // create a new instance of MeetingModel
  final meeting = MeetingModel(
    roomName: testRoom,
    createdAt: testCreatedAt,
  );

  group('MeetingModel', () {
    test('copyWith should returns a correct copy', () {
      // create a new copy of the request
      final copy = meeting.copyWith(
        roomName: 'new-$testRoom',
      );

      expect(copy.roomName, 'new-test-room-name');
      expect(copy.roomName, isNot(testRoom));
    });
    test('copyWith should return original value when no new value provided',
        () {
      // no new value provided
      final copy = meeting.copyWith();

      expect(copy.roomName, testRoom);
      expect(copy.createdAt, testCreatedAt);
    });
    test('props should returns correct properties', () {
      final props = meeting.props;

      expect(props, [
        testRoom,
        testCreatedAt,
      ]);
    });
  });
}
