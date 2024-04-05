import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_zoom/data/model/document/meeting_document.dart';
import 'package:flutter_zoom/data/constant/firebase_fields.dart';

void main() {
  const testUid = 'test-uid';
  const testRoom = 'test-room-name';

  group('MeetingDocument', () {
    test('fromMap constructs correct instance', () {
      final map = {
        FirebaseFields.uid: testUid,
        FirebaseFields.roomName: testRoom,
        FirebaseFields.createdAt: Timestamp.now(),
      };

      final document = MeetingDocument.fromMap(map);

      expect(document.uid, testUid);
      expect(document.roomName, testRoom);
      expect(document.createdAt, isNotNull);
    });

    test('toMap returns correct map', () {
      final document = MeetingDocument(
        uid: testUid,
        roomName: testRoom,
        createdAt: Timestamp.now(),
      );

      final map = document.toMap();

      expect(map[FirebaseFields.uid], testUid);
      expect(map[FirebaseFields.roomName], testRoom);
      expect(map[FirebaseFields.createdAt], isNotNull);
    });

    test('copyWith returns correct copy', () {
      final document = MeetingDocument(
        uid: testUid,
        roomName: testRoom,
        createdAt: Timestamp.now(),
      );

      final copy = document.copyWith(
        uid: 'new-uid',
        roomName: 'new-room',
      );

      expect(copy.uid, 'new-uid');
      expect(copy.roomName, 'new-room');
      expect(copy.createdAt, document.createdAt);
    });

    test('props should returns correct properties', () {
      final document = MeetingDocument(
        uid: testUid,
        roomName: testRoom,
        createdAt: Timestamp.now(),
      );

      final props = document.props;

      expect(props, [
        testUid,
        testRoom,
        document.createdAt,
      ]);
    });
  });
}
